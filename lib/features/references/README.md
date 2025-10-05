# References Feature

This feature manages professional references for medical professionals.

## Structure

```
lib/features/references/
├── data/
│   └── models/
│       └── reference_model.dart          # Reference data model
├── presentation/
│   ├── view/
│   │   ├── references_screen.dart        # Main references list screen
│   │   └── add_reference_screen.dart     # Add new reference screen
│   └── widgets/
│       ├── reference_card.dart           # Individual reference card widget
│       └── status_pill.dart             # Status indicator widget
└── README.md                            # This file
```

## Features

### ReferencesScreen
- Displays list of professional references
- Shows reference status (pending, verified, rejected)
- Add new reference functionality
- Edit existing references (placeholder)
- Empty state when no references exist

### AddReferenceScreen
- Form to add new professional references
- Fields: Name, Phone, Email, Specialty, Seniority, Hospital, Due Date
- Form validation
- Date picker for due date
- Dropdown selections for specialty and seniority

### ReferenceCard
- Displays individual reference information
- Status pill showing verification status
- Edit button for each reference
- Consistent styling with app design system

### StatusPill
- Color-coded status indicators
- Pending (orange), Verified (green), Rejected (red)
- Consistent styling across the app

## Data Model

### ReferenceModel
- Complete reference information
- Status tracking (pending, verified, rejected)
- Timestamps for creation and updates
- JSON serialization support

### ReferenceStatus Enum
- `pending`: Verification in progress
- `verified`: Successfully verified
- `rejected`: Verification failed

## Design Consistency

The feature follows the same design patterns as the registration screens:
- Uses `AppColors` for consistent theming
- Uses `TextStyles` for typography
- Uses `ResponsiveUtils` for responsive design
- Uses `sizer` package for screen adaptation
- Follows the same card-based layout
- Uses consistent spacing and padding

## Navigation

Accessible from:
- Account Screen → References menu item
- Direct navigation via `NavigationManager.navigateTo(const ReferencesScreen())`

## Future Enhancements

- Edit reference functionality
- Delete reference functionality
- Reference verification workflow
- Integration with backend API
- File attachments for references
- Bulk operations
