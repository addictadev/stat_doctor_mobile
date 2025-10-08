import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'dart:async';
import 'auth_controller.dart';
import '../data/models/registration_data_manager.dart';

/// Reference data model for references step
class ReferenceData {
  final TextEditingController nameController;
  final TextEditingController mobileController;
  final TextEditingController emailController;
  final TextEditingController hospitalController;
  String? specialty;
  String? seniority;

  ReferenceData({
    required this.nameController,
    required this.mobileController,
    required this.emailController,
    required this.hospitalController,
    this.specialty,
    this.seniority,
  });

  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    hospitalController.dispose();
  }
}

/// Controller for managing registration flow state and navigation
class RegistrationController extends ChangeNotifier {
  // Current step management
  int _currentStep = 1;
  int get currentStep => _currentStep;
  
  // Navigation control
  final PageController pageController = PageController();
  
  // Personal Info Step Data
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? _profileImagePath;
  File? _profileImageFile;
  bool _useFaceID = true;
  bool _useTouchID = true;
  
  // Medical Info Step Data
  final TextEditingController abnController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  String? _selectedDegree;
  String? _selectedSkillLevel;
  String? _selectedSpecialty;
  bool _hasRestrictions = true;
  
  // Backup data for navigation
  String? _backupSelectedDegree;
  String? _backupSelectedSkillLevel;
  String? _backupSelectedSpecialty;
  bool? _backupHasRestrictions;
  File? _cvFile;
  String? _cvFileName;
  
  // References Step Data
  final List<ReferenceData> _references = [];
  
  // Documentation Step Data
  String? _selectedPrimaryDocument;
  final List<String> _uploadedDocuments = [];
  final int _totalPoints = 100;
  
  // Other Documentation - File objects
  File? _medicalDegreeFile;
  File? _policeCheckFile;
  File? _workVisaFile;
  File? _medicalIndemnityFile;
  File? _workingWithChildrenFile;
  File? _vaccinationCertificateFile;
  File? _medicareCardFile;
  File? _secondaryEmploymentFile;
  
  // File names
  String? _medicalDegreeFileName;
  String? _policeCheckFileName;
  String? _workVisaFileName;
  String? _medicalIndemnityFileName;
  String? _workingWithChildrenFileName;
  String? _vaccinationCertificateFileName;
  String? _medicareCardFileName;
  String? _secondaryEmploymentFileName;
  
  // Getters for Personal Info
  String? get profileImagePath => _profileImagePath;
  File? get profileImageFile => _profileImageFile;
  bool get useFaceID => _useFaceID;
  bool get useTouchID => _useTouchID;
  
  // Getters for Medical Info
  String? get selectedDegree => _selectedDegree;
  String? get selectedSkillLevel => _selectedSkillLevel;
  String? get selectedSpecialty => _selectedSpecialty;
  bool get hasRestrictions => _hasRestrictions;
  File? get cvFile => _cvFile;
  String? get cvFileName => _cvFileName;
  
  // Getters for References
  List<ReferenceData> get references => _references;
  
  // Getters for Documentation
  String? get selectedPrimaryDocument => _selectedPrimaryDocument;
  List<String> get uploadedDocuments => _uploadedDocuments;
  int get totalPoints => _totalPoints;
  
  // Document files
  File? get medicalDegreeFile => _medicalDegreeFile;
  File? get policeCheckFile => _policeCheckFile;
  File? get workVisaFile => _workVisaFile;
  File? get medicalIndemnityFile => _medicalIndemnityFile;
  File? get workingWithChildrenFile => _workingWithChildrenFile;
  File? get vaccinationCertificateFile => _vaccinationCertificateFile;
  File? get medicareCardFile => _medicareCardFile;
  File? get secondaryEmploymentFile => _secondaryEmploymentFile;
  
  // Document file names
  String? get medicalDegreeFileName => _medicalDegreeFileName;
  String? get policeCheckFileName => _policeCheckFileName;
  String? get workVisaFileName => _workVisaFileName;
  String? get medicalIndemnityFileName => _medicalIndemnityFileName;
  String? get workingWithChildrenFileName => _workingWithChildrenFileName;
  String? get vaccinationCertificateFileName => _vaccinationCertificateFileName;
  String? get medicareCardFileName => _medicareCardFileName;
  String? get secondaryEmploymentFileName => _secondaryEmploymentFileName;
  
  // Form validation keys
  final GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> medicalInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> referencesFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> documentationFormKey = GlobalKey<FormState>();
  
  // Step validation states
  bool _isPersonalInfoValid = false;
  bool _isMedicalInfoValid = false;
  bool _isReferencesValid = false;
  bool _isDocumentationValid = false;
  
  // Validation attempt flags - only show validation errors after user tries to proceed
  bool _hasAttemptedPersonalInfoValidation = false;
  bool _hasAttemptedMedicalInfoValidation = false;
  bool _hasAttemptedReferencesValidation = false;
  bool _hasAttemptedDocumentationValidation = false;
  
  bool get isPersonalInfoValid => _isPersonalInfoValid;
  bool get isMedicalInfoValid => _isMedicalInfoValid;
  bool get isReferencesValid => _isReferencesValid;
  bool get isDocumentationValid => _isDocumentationValid;
  
  // Validation attempt flags
  bool get hasAttemptedPersonalInfoValidation => _hasAttemptedPersonalInfoValidation;
  bool get hasAttemptedMedicalInfoValidation => _hasAttemptedMedicalInfoValidation;
  bool get hasAttemptedReferencesValidation => _hasAttemptedReferencesValidation;
  bool get hasAttemptedDocumentationValidation => _hasAttemptedDocumentationValidation;
  
  // Image picker
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    abnController.dispose();
    bioController.dispose();
    for (var reference in _references) {
      reference.dispose();
    }
    pageController.dispose();
    super.dispose();
  }

  /// Navigate to next step with validation
  Future<bool> nextStep() async {
    if (_currentStep < 4) {
      // Validate current step before proceeding
      bool isValid = _validateCurrentStep();
      
      if (!isValid) {
        return false;
      }
      
      // Save current step data before moving forward
      _saveCurrentStepData();
      
      // Move to next step
      _currentStep++;
      // Reset validation attempts for the new step
      resetAllValidationAttempts();
      notifyListeners();
      
      // Animate to next page
      await pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      
      return true;
    } else {
      // Handle final step completion
      return await _completeRegistration();
    }
  }

  /// Navigate to previous step
  Future<void> previousStep() async {
    if (_currentStep > 1) {
      // Save current step data before going back
      _saveCurrentStepData();
      
      _currentStep--;
      
      // Restore previous step data BEFORE resetting validation attempts
      _restoreStepData(_currentStep);
      
      // Reset validation attempts for the new step
      resetAllValidationAttempts();
      
      // Notify listeners after all data is restored
      notifyListeners();
      
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Validate current step
  bool _validateCurrentStep() {
    switch (_currentStep) {
      case 1:
        return _validatePersonalInfo();
      case 2:
        return _validateMedicalInfo();
      case 3:
        return _validateReferences();
      case 4:
        return _validateDocumentation();
      default:
        return true;
    }
  }

  /// Validate Personal Info step
  bool _validatePersonalInfo() {
    // Mark that validation has been attempted
    _hasAttemptedPersonalInfoValidation = true;
    
    // Check form validation
    bool formValid = personalInfoFormKey.currentState?.validate() ?? false;
    
    // Check profile image validation
    bool profileImageValid = _profileImagePath != null || _profileImageFile != null;
    
    bool allValid = formValid && profileImageValid;
    
    _isPersonalInfoValid = allValid;
    notifyListeners();
    return allValid;
  }

  /// Validate Medical Info step
  bool _validateMedicalInfo() {
    // Mark that validation has been attempted
    _hasAttemptedMedicalInfoValidation = true;
    
    // First validate the form to show any validation errors
    bool formValid = medicalInfoFormKey.currentState?.validate() ?? false;
    
    // Additional validation for required fields
    bool degreeValid = _selectedDegree != null && _selectedDegree!.isNotEmpty;
    bool skillLevelValid = _selectedSkillLevel != null && _selectedSkillLevel!.isNotEmpty;
    bool specialtyValid = _selectedSpecialty != null && _selectedSpecialty!.isNotEmpty;
    bool cvValid = _cvFile != null && _cvFileName != null && _cvFileName!.isNotEmpty;
    
    bool allValid = formValid && degreeValid && skillLevelValid && specialtyValid && cvValid;
    
    _isMedicalInfoValid = allValid;
    notifyListeners();
    return allValid;
  }

  /// Validate References step
  bool _validateReferences() {
    // Mark that validation has been attempted
    _hasAttemptedReferencesValidation = true;
    
    if (referencesFormKey.currentState?.validate() ?? false) {
      // Check if at least one reference is provided
      if (_references.isEmpty) {
        _isReferencesValid = false;
        notifyListeners();
        return false;
      }
      
      // Validate each reference has required fields
      for (var reference in _references) {
        if (reference.nameController.text.trim().isEmpty ||
            reference.emailController.text.trim().isEmpty ||
            reference.mobileController.text.trim().isEmpty ||
            reference.hospitalController.text.trim().isEmpty ||
            reference.specialty == null ||
            reference.seniority == null) {
          _isReferencesValid = false;
          notifyListeners();
          return false;
        }
      }
      
      _isReferencesValid = true;
      notifyListeners();
      return true;
    }
    _isReferencesValid = false;
    notifyListeners();
    return false;
  }

  /// Validate Documentation step
  bool _validateDocumentation() {
    // Mark that validation has been attempted
    _hasAttemptedDocumentationValidation = true;
    
    // Documentation step is always valid - all fields are optional
    // Just validate the form state without strict requirements
    bool formValid = documentationFormKey.currentState?.validate() ?? true;
    
    _isDocumentationValid = formValid;
    notifyListeners();
    return formValid;
  }

  /// Complete registration process
  Future<bool> _completeRegistration() async {
    try {
      // Validate final step before submission
      bool isValid = _validateCurrentStep();
      if (!isValid) {
        return false;
      }

      // Return true to indicate validation passed
      // The actual registration submission will be handled by the UI layer
      return true;
    } catch (e) {
      log('Error during registration: $e');
      return false;
    }
  }

  /// Complete registration with context (called from UI)
  Future<bool> completeRegistration(BuildContext context) async {
    try {
      // Validate final step before submission
      bool isValid = _validateCurrentStep();
      if (!isValid) {
        return false;
      }

      // Show loading indicator immediately
      EasyLoading.show(
        status: 'Creating your account...',
        maskType: EasyLoadingMaskType.black,
      );

      // Get AuthController and prepare registration data
      final authController = Provider.of<AuthController>(context, listen: false);
      
      // Transfer all data to AuthController's data manager
      _transferDataToAuthController(authController);
      
      // Build registration data
      authController.buildRegistrationData();
      
      // Submit registration (without showing loading again in AuthController)
      final success = await authController.register();
      
      // Hide loading indicator
      EasyLoading.dismiss();
      
      return success;
    } catch (e) {
      log('Error during registration: $e');
      EasyLoading.dismiss();
      return false;
    }
  }

  /// Transfer all registration data to AuthController's data manager
  void _transferDataToAuthController(AuthController authController) {
    final dataManager = authController.dataManager;
    
    // Transfer Personal Info - only non-empty values
    dataManager.setPersonalInfo(
      firstName: firstNameController.text.trim(),
      surname: lastNameController.text.trim(),
      email: emailController.text.trim(),
      profilePic: _profileImagePath?.isNotEmpty == true ? _profileImagePath : '',
    );
    
    // Transfer Medical Info - only non-empty values
    dataManager.setMedicalInfo(
      abn: abnController.text.trim().isNotEmpty ? abnController.text.trim() : '',
      ahpraNumber: '', // Set empty string instead of null
      medicalDegree: _selectedDegree?.isNotEmpty == true ? _selectedDegree! : '',
      skillLevel: _selectedSkillLevel?.isNotEmpty == true ? _selectedSkillLevel! : '',
      specialties: _selectedSpecialty?.isNotEmpty == true ? _selectedSpecialty! : '',
      resumeFileName: _cvFileName?.isNotEmpty == true ? _cvFileName! : '',
      resumeFileUrl: _cvFile?.path.isNotEmpty == true ? _cvFile!.path : '',
      shortWork: bioController.text.trim().isNotEmpty ? bioController.text.trim() : '',
    );
    
    // Transfer References - only if they have data
    // Clear existing references first to avoid duplicates
    dataManager.references.clear();
    for (int i = 0; i < _references.length; i++) {
      final ref = _references[i];
      if (ref.nameController.text.trim().isNotEmpty ||
          ref.emailController.text.trim().isNotEmpty ||
          ref.mobileController.text.trim().isNotEmpty ||
          ref.hospitalController.text.trim().isNotEmpty) {
        dataManager.addReference(ReferenceStepData(
          fullName: ref.nameController.text.trim(),
          email: ref.emailController.text.trim(),
          mobile: ref.mobileController.text.trim(),
          hospitalCurrent: ref.hospitalController.text.trim(),
          specialty: ref.specialty?.isNotEmpty == true ? ref.specialty! : '',
          seniority: ref.seniority?.isNotEmpty == true ? ref.seniority! : '',
          seq: i + 1,
        ));
      }
    }
    
    // Transfer Documentation - only non-empty values
    dataManager.setDocumentsInfo(
      primaryDocument: _selectedPrimaryDocument?.isNotEmpty == true ? _selectedPrimaryDocument! : '',
      primaryDocumentExt: _selectedPrimaryDocument?.isNotEmpty == true ? _selectedPrimaryDocument! : '',
      medicalDegreeDoc: _medicalDegreeFile?.path.isNotEmpty == true ? _medicalDegreeFile!.path : '',
      medicalDegreeDocExt: _medicalDegreeFileName?.isNotEmpty == true ? _medicalDegreeFileName! : '',
      policeCheck: _policeCheckFile?.path.isNotEmpty == true ? _policeCheckFile!.path : '',
      policeCheckExt: _policeCheckFileName?.isNotEmpty == true ? _policeCheckFileName! : '',
      workVisa: _workVisaFile?.path.isNotEmpty == true ? _workVisaFile!.path : '',
      workVisaExt: _workVisaFileName?.isNotEmpty == true ? _workVisaFileName! : '',
      workingWithChildrenCheck: _workingWithChildrenFile?.path.isNotEmpty == true ? _workingWithChildrenFile!.path : '',
      workingWithChildrenCheckExt: _workingWithChildrenFileName?.isNotEmpty == true ? _workingWithChildrenFileName! : '',
      vaccinationCertificate: _vaccinationCertificateFile?.path.isNotEmpty == true ? _vaccinationCertificateFile!.path : '',
      vaccinationCertificateExt: _vaccinationCertificateFileName?.isNotEmpty == true ? _vaccinationCertificateFileName! : '',
      medicareCard: _medicareCardFile?.path.isNotEmpty == true ? _medicareCardFile!.path : '',
      medicareCardExt: _medicareCardFileName?.isNotEmpty == true ? _medicareCardFileName! : '',
      approvalForSecondaryEmployment: _secondaryEmploymentFile?.path.isNotEmpty == true ? _secondaryEmploymentFile!.path : '',
      approvalForSecondaryEmploymentExt: _secondaryEmploymentFileName?.isNotEmpty == true ? _secondaryEmploymentFileName! : '',
    );
  }

  /// Set Personal Info data
  void setPersonalInfo({
    required String firstName,
    required String lastName,
    required String email,
    String? profileImagePath,
    File? profileImageFile,
    bool? useFaceID,
    bool? useTouchID,
  }) {
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    emailController.text = email;
    
    if (profileImagePath != null) _profileImagePath = profileImagePath;
    if (profileImageFile != null) _profileImageFile = profileImageFile;
    if (useFaceID != null) _useFaceID = useFaceID;
    if (useTouchID != null) _useTouchID = useTouchID;
    
    notifyListeners();
  }

  /// Pick profile image
  Future<void> pickProfileImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );
      
      if (image != null) {
        _profileImageFile = File(image.path);
        _profileImagePath = image.path;
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      rethrow;
    }
  }

  /// Update Face ID preference
  void updateFaceIDPreference(bool value) {
    _useFaceID = value;
    notifyListeners();
  }

  /// Update Touch ID preference
  void updateTouchIDPreference(bool value) {
    _useTouchID = value;
    notifyListeners();
  }

  /// Update Medical Degree selection
  void updateMedicalDegree(String? value) {
    _selectedDegree = value;
    notifyListeners();
  }

  /// Update Skill Level selection
  void updateSkillLevel(String? value) {
    _selectedSkillLevel = value;
    notifyListeners();
  }

  /// Update Specialty selection
  void updateSpecialty(String? value) {
    _selectedSpecialty = value;
    notifyListeners();
  }

  /// Update restrictions preference
  void updateRestrictions(bool value) {
    _hasRestrictions = value;
    notifyListeners();
  }

  /// Pick CV file using file picker (PDF only)
  Future<void> pickCVFileWithFilePicker() async {
    try {
      // Use a more stable file picker configuration with timeout
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
        withData: false,
        withReadStream: false,
        lockParentWindow: true, // Lock parent window to prevent navigation issues
      ).timeout(
        Duration(seconds: 30), // Add timeout to prevent hanging
        onTimeout: () {
          throw TimeoutException('File picker timed out', Duration(seconds: 30));
        },
      );
      
      if (result != null && result.files.isNotEmpty && result.files.first.path != null) {
        final file = File(result.files.first.path!);
        final fileName = result.files.first.name;
        
        // Validate file size
        if (_validateCVFileSize(file)) {
          _cvFile = file;
          _cvFileName = fileName;
          notifyListeners();
        } else {
          throw Exception('CV file is too large. Please upload a PDF file under 5MB.');
        }
      }
    } on TimeoutException catch (e) {
      log('File picker timeout: $e');
      // Don't rethrow timeout exceptions to prevent navigation issues
    } catch (e) {
      // Don't rethrow to prevent navigation issues
      log('Error picking CV file: $e');
      // Error will be handled by the UI layer
    }
  }

  /// Pick CV file (legacy method for image picker - not recommended for PDF)
  Future<void> pickCVFile(ImageSource source) async {
    try {
      // For CV, we should use file picker instead of image picker
      // This method is kept for compatibility but should not be used for PDF files
      final XFile? file = await _imagePicker.pickImage(
        source: source,
        maxWidth: 2048,
        maxHeight: 2048,
        imageQuality: 90,
      );
      
      if (file != null) {
        // Validate file type and size
        if (_validateCVFile(file)) {
          _cvFile = File(file.path);
          _cvFileName = file.name;
          notifyListeners();
        } else {
          throw Exception('Invalid CV file. Please upload a PDF file under 5MB.');
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Set CV file directly (for file picker integration)
  void setCVFile(File file, String fileName) {
    // Validate the file
    final xFile = XFile(file.path);
    if (_validateCVFile(xFile)) {
      _cvFile = file;
      _cvFileName = fileName;
      notifyListeners();
    } else {
      throw Exception('Invalid CV file. Please upload a PDF file under 5MB.');
    }
  }

  /// Validate CV file
  bool _validateCVFile(XFile file) {
    // Check file extension
    String extension = file.path.toLowerCase().split('.').last;
    if (extension != 'pdf') {
      return false;
    }
    
    // Check file size (5MB limit for PDF)
    final fileSize = File(file.path).lengthSync();
    const maxSize = 5 * 1024 * 1024; // 5MB in bytes
    
    return fileSize <= maxSize;
  }

  /// Validate CV file size only (for file picker)
  bool _validateCVFileSize(File file) {
    // Check file size (5MB limit for PDF)
    final fileSize = file.lengthSync();
    const maxSize = 5 * 1024 * 1024; // 5MB in bytes
    
    return fileSize <= maxSize;
  }

  /// Pick document file with validation
  Future<void> pickDocumentFile(String documentType, ImageSource source) async {
    try {
      // Use file picker for documents - allow all file types
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );
      
      if (result != null && result.files.isNotEmpty && result.files.first.path != null) {
        final file = File(result.files.first.path!);
        final fileName = result.files.first.name;
        
        // Validate file based on document type
        if (_validateDocumentFile(documentType, file)) {
          updateDocumentFile(documentType, file, fileName);
        } else {
          throw Exception(_getDocumentValidationError(documentType));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Validate document file based on type
  bool _validateDocumentFile(String documentType, File file) {
    try {
      // Get file extension
      String extension = file.path.toLowerCase().split('.').last;
      
      // List of allowed extensions for documents
      List<String> allowedExtensions = [
        'pdf', 'jpg', 'jpeg', 'png', 'gif', 'bmp', 'tiff', 'tif',
        'doc', 'docx', 'txt', 'rtf'
      ];
      
      // Check if extension is allowed
      if (!allowedExtensions.contains(extension)) {
        log('File extension not allowed: $extension');
        return false;
      }
      
      // Check file size (15MB limit - more generous)
      final fileSize = file.lengthSync();
      const maxSize = 15 * 1024 * 1024; // 15MB
      
      if (fileSize > maxSize) {
        log('File too large: ${fileSize / (1024 * 1024)}MB (max: ${maxSize / (1024 * 1024)}MB)');
        return false;
      }
      
      log('File validation passed: ${file.path} ($extension, ${fileSize / (1024 * 1024)}MB)');
      return true;
    } catch (e) {
      log('File validation error: $e');
      return false;
    }
  }

  /// Get validation error message for document type
  String _getDocumentValidationError(String documentType) {
    switch (documentType) {
      case 'medical_degree':
        return 'Medical degree must be a PDF, image, or document file under 15MB';
      case 'police_check':
        return 'Police check must be a PDF, image, or document file under 15MB';
      case 'work_visa':
        return 'Work visa must be a PDF, image, or document file under 15MB';
      case 'medical_indemnity':
        return 'Medical indemnity must be a PDF, image, or document file under 15MB';
      case 'working_with_children':
        return 'Working with children check must be a PDF, image, or document file under 15MB';
      case 'vaccination_certificate':
        return 'Vaccination certificate must be a PDF, image, or document file under 15MB';
      case 'medicare_card':
        return 'Medicare card must be a PDF, image, or document file under 15MB';
      case 'secondary_employment':
        return 'Secondary employment approval must be a PDF, image, or document file under 15MB';
      default:
        return 'File must be PDF, image, or document format under 15MB';
    }
  }

  /// Remove CV file
  void removeCVFile() {
    _cvFile = null;
    _cvFileName = null;
    notifyListeners();
  }

  /// Add new reference
  void addReference() {
    _references.add(ReferenceData(
      nameController: TextEditingController(),
      mobileController: TextEditingController(),
      emailController: TextEditingController(),
      hospitalController: TextEditingController(),
    ));
    notifyListeners();
  }

  /// Remove reference at index
  void removeReference(int index) {
    if (index >= 0 && index < _references.length) {
      _references[index].dispose();
      _references.removeAt(index);
      notifyListeners();
    }
  }

  /// Update reference specialty
  void updateReferenceSpecialty(int index, String? specialty) {
    if (index >= 0 && index < _references.length) {
      _references[index].specialty = specialty;
      notifyListeners();
    }
  }

  /// Update reference seniority
  void updateReferenceSeniority(int index, String? seniority) {
    if (index >= 0 && index < _references.length) {
      _references[index].seniority = seniority;
      notifyListeners();
    }
  }

  /// Update primary document selection
  void updatePrimaryDocument(String? document) {
    _selectedPrimaryDocument = document;
    notifyListeners();
  }

  /// Add uploaded document
  void addUploadedDocument(String documentName) {
    if (!_uploadedDocuments.contains(documentName)) {
      _uploadedDocuments.add(documentName);
      notifyListeners();
    }
  }

  /// Remove uploaded document
  void removeUploadedDocument(String documentName) {
    _uploadedDocuments.remove(documentName);
    notifyListeners();
  }

  /// Update document file
  void updateDocumentFile(String documentType, File file, String fileName) {
    switch (documentType) {
      case 'medical_degree':
        _medicalDegreeFile = file;
        _medicalDegreeFileName = fileName;
        break;
      case 'police_check':
        _policeCheckFile = file;
        _policeCheckFileName = fileName;
        break;
      case 'work_visa':
        _workVisaFile = file;
        _workVisaFileName = fileName;
        break;
      case 'medical_indemnity':
        _medicalIndemnityFile = file;
        _medicalIndemnityFileName = fileName;
        break;
      case 'working_with_children':
        _workingWithChildrenFile = file;
        _workingWithChildrenFileName = fileName;
        break;
      case 'vaccination_certificate':
        _vaccinationCertificateFile = file;
        _vaccinationCertificateFileName = fileName;
        break;
      case 'medicare_card':
        _medicareCardFile = file;
        _medicareCardFileName = fileName;
        break;
      case 'secondary_employment':
        _secondaryEmploymentFile = file;
        _secondaryEmploymentFileName = fileName;
        break;
    }
    notifyListeners();
  }

  /// Remove document file
  void removeDocumentFile(String documentType) {
    switch (documentType) {
      case 'medical_degree':
        _medicalDegreeFile = null;
        _medicalDegreeFileName = null;
        break;
      case 'police_check':
        _policeCheckFile = null;
        _policeCheckFileName = null;
        break;
      case 'work_visa':
        _workVisaFile = null;
        _workVisaFileName = null;
        break;
      case 'medical_indemnity':
        _medicalIndemnityFile = null;
        _medicalIndemnityFileName = null;
        break;
      case 'working_with_children':
        _workingWithChildrenFile = null;
        _workingWithChildrenFileName = null;
        break;
      case 'vaccination_certificate':
        _vaccinationCertificateFile = null;
        _vaccinationCertificateFileName = null;
        break;
      case 'medicare_card':
        _medicareCardFile = null;
        _medicareCardFileName = null;
        break;
      case 'secondary_employment':
        _secondaryEmploymentFile = null;
        _secondaryEmploymentFileName = null;
        break;
    }
    notifyListeners();
  }

  /// Clear all form data (for reset/new registration)
  void clearAllData() {
    // Personal Info
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    _profileImagePath = null;
    _profileImageFile = null;
    _useFaceID = true;
    _useTouchID = true;
    
    // Medical Info
    abnController.clear();
    bioController.clear();
    _selectedDegree = null;
    _selectedSkillLevel = null;
    _selectedSpecialty = null;
    _hasRestrictions = true;
    _cvFile = null;
    _cvFileName = null;
    
    // References
    for (var reference in _references) {
      reference.dispose();
    }
    _references.clear();
    
    // Documentation
    _selectedPrimaryDocument = null;
    _uploadedDocuments.clear();
    _medicalDegreeFile = null;
    _policeCheckFile = null;
    _workVisaFile = null;
    _medicalIndemnityFile = null;
    _workingWithChildrenFile = null;
    _vaccinationCertificateFile = null;
    _medicareCardFile = null;
    _secondaryEmploymentFile = null;
    _medicalDegreeFileName = null;
    _policeCheckFileName = null;
    _workVisaFileName = null;
    _medicalIndemnityFileName = null;
    _workingWithChildrenFileName = null;
    _vaccinationCertificateFileName = null;
    _medicareCardFileName = null;
    _secondaryEmploymentFileName = null;
    
    // Reset validation states
    _isPersonalInfoValid = false;
    _isMedicalInfoValid = false;
    _isReferencesValid = false;
    _isDocumentationValid = false;
    
    notifyListeners();
  }

  /// Save current step data before navigation
  void _saveCurrentStepData() {
    switch (_currentStep) {
      case 1:
        // Personal info is already saved in controllers
        break;
      case 2:
        // Save medical info dropdown values to backup when moving forward
        _backupSelectedDegree = _selectedDegree;
        _backupSelectedSkillLevel = _selectedSkillLevel;
        _backupSelectedSpecialty = _selectedSpecialty;
        _backupHasRestrictions = _hasRestrictions;
        break;
      case 3:
        // References data is already saved in _references list
        break;
      case 4:
        // Documentation data is already saved in controller state variables
        break;
    }
  }

  /// Restore step data when navigating back
  void _restoreStepData(int step) {
    switch (step) {
      case 1:
        // Personal info is already in controllers
        break;
      case 2:
        // Restore medical info dropdown values from backup
        _selectedDegree = _backupSelectedDegree;
        _selectedSkillLevel = _backupSelectedSkillLevel;
        _selectedSpecialty = _backupSelectedSpecialty;
        _hasRestrictions = _backupHasRestrictions ?? true;
        break;
      case 3:
        // References data is already in _references list
        break;
      case 4:
        // Documentation data is already in controller state variables
        break;
    }
  }


  /// Get validation error message for current step
  String getValidationErrorMessage() {
    switch (_currentStep) {
      case 1:
        return 'Please complete all required personal information fields including profile image';
      case 2:
        return 'Please complete all required medical information fields including CV upload (PDF required)';
      case 3:
        return 'Please complete all required references fields';
        case 4:
          return 'Please check documentation fields for any errors';
      default:
        return 'Please complete all required fields';
    }
  }

  /// Check if current step can proceed
  bool canProceedToNextStep() {
    switch (_currentStep) {
      case 1:
        return _isPersonalInfoValid;
      case 2:
        return _isMedicalInfoValid;
      case 3:
        return _isReferencesValid;
      case 4:
        return _isDocumentationValid;
      default:
        return false;
    }
  }



  /// Reset validation state for a specific step
  void resetStepValidation(int step) {
    switch (step) {
      case 1:
        _isPersonalInfoValid = false;
        _hasAttemptedPersonalInfoValidation = false;
        break;
      case 2:
        _isMedicalInfoValid = false;
        _hasAttemptedMedicalInfoValidation = false;
        break;
      case 3:
        _isReferencesValid = false;
        _hasAttemptedReferencesValidation = false;
        break;
      case 4:
        _isDocumentationValid = false;
        _hasAttemptedDocumentationValidation = false;
        break;
    }
    notifyListeners();
  }

  /// Reset all validation attempt flags (call when starting fresh or navigating between steps)
  void resetAllValidationAttempts() {
    _hasAttemptedPersonalInfoValidation = false;
    _hasAttemptedMedicalInfoValidation = false;
    _hasAttemptedReferencesValidation = false;
    _hasAttemptedDocumentationValidation = false;
    // Don't call notifyListeners() here - it will be called by the calling method
  }
}
