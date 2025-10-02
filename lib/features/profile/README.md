# Profile Feature

This feature implements comprehensive profile management screens for the Stat Doctor mobile app, designed based on the provided UI mockups with modern UX patterns and responsive design.

## Features

### 🎯 Core Functionality
- **Profile Display**: Beautiful header card with user information and gradient background
- **Edit Profile**: Complete form for editing user details with validation
- **Menu Navigation**: Clean menu items for different profile sections
- **Logout Functionality**: Secure logout with confirmation dialog
- **Profile Image**: Support for profile image display and editing
- **Responsive Design**: Adapts to different screen sizes using project utilities

### 🎨 UI/UX Features
- **Gradient Header**: Beautiful blue gradient header matching the design
- **Card-based Layout**: Clean white cards with proper shadows and spacing
- **Form Validation**: Comprehensive form validation with user feedback
- **Smooth Animations**: Smooth transitions and interactions
- **Accessibility**: Proper contrast ratios and touch targets
- **Modern Design**: Clean, professional layout with consistent styling

### 📱 Profile Sections
- **Medical Profile**: Access to medical information
- **References**: Reference management with verification status
- **Documents**: ID and document management
- **Notifications**: Notification preferences
- **Settings**: App settings and preferences

## Architecture

### Domain Layer
- `UserProfileEntity`: Core user profile data model with business logic
- Helper methods for display names, initials, and computed properties

### Data Layer
- `UserProfileModel`: Data model extending entity with JSON serialization
- Sample data for testing and development

### Presentation Layer
- `AccountScreen`: Main profile screen with header and menu
- `EditProfileScreen`: Profile editing form with validation
- `ProfileHeaderCard`: Reusable header component with gradient
- `ProfileMenuItem`: Reusable menu item component
- `LogoutButton`: Styled logout button component
- `LogoutConfirmationDialog`: Confirmation dialog for logout

## Usage

### Basic Implementation
```dart
// Navigate to profile screen
NavigationManager.navigateTo(AccountScreen());

// Navigate to edit profile
NavigationManager.navigateTo(EditProfileScreen(userProfile: userProfile));
```

### Customization
The profile screens use the app's existing design system:
- Colors from `AppColors`
- Text styles from `TextStyles`
- Responsive utilities from `ResponsiveUtils`
- Custom widgets from the project

### Data Integration
To integrate with real data, replace the sample data with your actual data source:

```dart
class UserProfileService {
  Future<UserProfileModel> getUserProfile() async {
    // Implement API call
  }
  
  Future<void> updateProfile(UserProfileModel profile) async {
    // Implement API call
  }
  
  // ... other methods
}
```

## Design Patterns

### State Management
- Uses `StatefulWidget` with local state management
- Implements proper form validation and error handling
- Follows the project's existing patterns

### Form Handling
- Text controllers for form fields
- Validation with user feedback
- Proper disposal of resources

### Navigation
- Uses the project's `NavigationManager`
- Proper back navigation handling
- Modal dialogs for confirmations

## File Structure

```
lib/features/profile/
├── domain/
│   └── entities/
│       └── user_profile_entity.dart
├── data/
│   └── models/
│       └── user_profile_model.dart
├── presentation/
│   └── widgets/
│       ├── profile_header_card.dart
│       ├── profile_menu_item.dart
│       ├── logout_button.dart
│       └── logout_confirmation_dialog.dart
└── README.md
```

## Dependencies

- `flutter/material.dart`: Core Flutter widgets
- `sizer`: Responsive design utilities
- `iconsax`: Icon library
- `localize_and_translate`: Internationalization
- Project-specific utilities and themes

## Future Enhancements

1. **Image Picker**: Full image picker integration for profile photos
2. **Real-time Updates**: Live profile updates across the app
3. **Profile Verification**: User verification status and badges
4. **Social Features**: Social profile sharing and connections
5. **Privacy Settings**: Granular privacy controls
6. **Profile Analytics**: Usage analytics and insights
7. **Offline Support**: Local storage with sync capabilities

## Testing

The implementation includes sample data for testing all features:
- Complete user profile with all fields
- Form validation scenarios
- Navigation flows
- Error handling

## Performance Considerations

- Efficient image loading and caching
- Optimized form rendering
- Memory-efficient state management
- Proper resource disposal

## Accessibility

- Proper semantic labels for screen readers
- High contrast color schemes
- Appropriate touch target sizes
- Keyboard navigation support
- Screen reader friendly form labels

## Security Considerations

- Input validation and sanitization
- Secure logout functionality
- Proper session management
- Data encryption for sensitive information

## Integration Points

- **Authentication**: User login/logout flows
- **Navigation**: Bottom navigation and app routing
- **Settings**: App-wide settings and preferences
- **Notifications**: Notification preferences and management
- **Documents**: File upload and management
- **References**: Reference verification system
