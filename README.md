# Flutter Learning Tracker — README

> Android-only Flutter app. Start simple, then add BLoC and advanced features later.

## Stack

- Flutter
- Material 3
- `go_router`
- Firebase Authentication
- Google Sign-In
- `setState` first
- `flutter_bloc` later
- `sensors_plus`
- `home_widget`

## Suggested structure

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
├── core/
│   ├── services/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── home/
│   ├── topics/
│   ├── tasks/
│   ├── notes/
│   ├── timer/
│   ├── statistics/
│   ├── sensors/
│   ├── navigation/
│   └── settings/
└── shared/
    ├── models/
    └── widgets/
```

Use `core/widgets` for generic widgets such as loading indicators, error views, empty states, confirmation dialogs, and shared buttons.

Use feature widgets for feature-specific UI.

```text
features/topics/presentation/widgets/topic_card.dart
features/navigation/presentation/widgets/app_navigation_bar.dart
```

## Routing

Use normal `GoRoute`s for now.

```dart
final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/topics',
      builder: (_, __) => const TopicsScreen(),
      routes: [
        GoRoute(
          path: ':topicId',
          builder: (_, state) => TopicDetailsScreen(
            topicId: state.pathParameters['topicId']!,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/timer',
      builder: (_, __) => const TimerScreen(),
    ),
    GoRoute(
      path: '/statistics',
      builder: (_, __) => const StatisticsScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (_, __) => const SettingsScreen(),
    ),
  ],
);
```

Use:

```dart
context.go('/topics');
```

for main destinations.

Use:

```dart
context.push('/topics/$topicId');
```

for details and forms.

Use:

```dart
context.pop();
```

to return from a pushed screen.

## Navigation bar

Create one reusable widget:

```text
features/navigation/presentation/widgets/app_navigation_bar.dart
```

Use it in each main screen:

```dart
Scaffold(
  body: ...,
  bottomNavigationBar: const AppNavigationBar(
    selectedIndex: 0,
  ),
);
```

If preserving tab stacks and scroll becomes important later, migrate to `StatefulShellRoute.indexedStack`.

## Home

Use Home as a dashboard:

- Greeting
- Today's study time
- Daily goal
- Recent topics
- Next tasks
- Continue studying
- Start timer button

```text
features/home/presentation/
├── screens/
│   └── home_screen.dart
└── widgets/
    ├── greeting_header.dart
    ├── daily_goal_card.dart
    ├── recent_topics_section.dart
    ├── upcoming_tasks_section.dart
    └── start_timer_button.dart
```

## 4-week plan

### Week 1

- [ ] Project setup
- [ ] Material 3
- [ ] Themes
- [ ] `go_router`
- [ ] Firebase setup
- [ ] Email/password registration
- [ ] Login
- [ ] Password reset
- [ ] Google Sign-In
- [ ] Logout
- [ ] Profile screen

### Week 2

- [ ] Topic CRUD
- [ ] Task CRUD
- [ ] Notes CRUD
- [ ] Topic progress
- [ ] Search
- [ ] Filters
- [ ] Sorting
- [ ] Connect Flutter to backend API

### Week 3

- [ ] Add `flutter_bloc`
- [ ] Move auth to BLoC
- [ ] Move topics to BLoC
- [ ] Move tasks to BLoC
- [ ] Move notes to BLoC
- [ ] Add study timer
- [ ] Save study sessions

### Week 4

- [ ] Sensors
- [ ] Statistics
- [ ] Android home-screen widget
- [ ] Tests
- [ ] Release signing
- [ ] Release APK
- [ ] Android App Bundle

## BLoC migration order

- [ ] Settings
- [ ] Authentication
- [ ] Topics
- [ ] Tasks
- [ ] Notes
- [ ] Timer
- [ ] Sensors
- [ ] Statistics

Do not migrate a feature until it already works with `setState`.

## Navigation rule

```text
go()   → main destinations
push() → details and forms
pop()  → return from pushed screens
```
