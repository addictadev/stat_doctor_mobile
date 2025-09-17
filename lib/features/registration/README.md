# Registration Feature

This feature implements a comprehensive 4-step registration process for medical professionals, designed with responsive UI and clean architecture principles.

## Overview

The registration process consists of 4 main steps:
1. **Personal Info** - Basic profile information and biometric login preferences
2. **Medical Info** - Professional credentials, specialties, and work bio
3. **References** - Professional references and contacts
4. **Documentation** - Required documents and certifications

## Architecture

### File Structure
```
lib/features/registration/
├── presentation/
│   └── view/
│       ├── registration_screen.dart          # Main registration controller
│       ├── personal_info_step.dart           # Step 1: Personal information
│       ├── medical_info_step.dart            # Step 2: Medical credentials
│       ├── references_step.dart              # Step 3: Professional references
│       ├── documentation_step.dart           # Step 4: Document uploads
│       └── registration_demo_screen.dart     # Demo screen for testing
└── README.md
```

### Core Widgets Used
```
lib/core/widgets/
├── registration_step_indicator.dart          # Progress indicator
├── custom_textform_field.dart                # Enhanced text inputs
├── custom_dropdown_field.dart                # Dropdown selections
├── custom_radio_tile.dart                    # Radio button tiles
├── custom_toggle_switch.dart                 # Toggle switches
├── profile_image_picker.dart                 # Profile photo picker
├── file_upload_button.dart                   # File upload component
└── primary_button.dart                       # Primary action button
```

## Features

### 1. Personal Info Step
- Profile image picker with edit functionality
- First name, last name, and email fields
- Biometric login preferences (FaceID/TouchID)
- Form validation for required fields

### 2. Medical Info Step
- Medical degree selection dropdown
- Skill level selection
- Specialty selection
- AHPRA license restrictions toggle
- ABN (Australian Business Number) field
- Work bio text area with character limit (850 chars)
- CV/Resume upload functionality

### 3. References Step
- Up to 3 professional references
- Required fields: Name, title, email, phone, relationship
- Form validation for email format and required fields
- Clean card-based layout for each reference

### 4. Documentation Step
- Medical license information and upload
- Government ID document upload
- Professional indemnity insurance upload
- Background check upload
- Optional supporting documents
- Terms and conditions acceptance

## Design Principles

### Responsive Design
- Uses `ResponsiveUtils` for consistent spacing and sizing
- Adapts to different screen sizes (mobile, tablet, desktop)
- Uses `Sizer` package for responsive measurements

### Color Scheme
- Follows existing `AppColors` theme
- Primary blue (#0957DE) for active states
- Consistent use of text colors and backgrounds
- Proper contrast ratios for accessibility

### Form Validation
- Real-time validation with user-friendly error messages
- Required field indicators
- Email format validation
- Character limits for text areas

### User Experience
- Smooth page transitions with PageView
- Progress indicator showing current step
- Previous/Next navigation buttons
- Consistent spacing and typography
- Loading states and feedback

## Usage

### Navigation
```dart
import 'package:stat_doctor/features/registration/presentation/view/registration_screen.dart';
import 'package:stat_doctor/core/navigation_services/navigation_manager.dart';

// Navigate to registration
NavigationManager.navigateTo(const RegistrationScreen());
```

### Demo Screen
```dart
import 'package:stat_doctor/features/registration/presentation/view/registration_demo_screen.dart';

// Show demo screen
NavigationManager.navigateTo(const RegistrationDemoScreen());
```

## Customization

### Adding New Steps
1. Create a new step widget in `presentation/view/`
2. Add the step to the `PageView` in `registration_screen.dart`
3. Update the `stepLabels` list
4. Adjust the `totalSteps` count

### Modifying Form Fields
- Use existing custom widgets for consistency
- Follow the validation patterns established
- Maintain responsive design principles
- Use the established color scheme

### Styling Changes
- Modify `AppColors` for global color changes
- Update `ResponsiveUtils` for spacing adjustments
- Customize individual widgets as needed

## Dependencies

- `flutter/material.dart` - Core Flutter widgets
- `sizer` - Responsive design utilities
- `stat_doctor/core/theme/app_colors.dart` - Color scheme
- `stat_doctor/core/utils/responsive_utils.dart` - Responsive utilities
- `stat_doctor/core/widgets/*` - Custom UI components

## Future Enhancements

- [ ] Image picker integration for profile photos
- [ ] File upload service integration
- [ ] Form data persistence
- [ ] API integration for registration submission
- [ ] Biometric authentication implementation
- [ ] Multi-language support
- [ ] Accessibility improvements
- [ ] Unit and widget tests

## Notes

- All form data is currently stored in local state
- File upload functionality shows placeholder dialogs
- Image picker shows placeholder dialogs
- Form validation is client-side only
- Navigation uses the existing `NavigationManager`
