# Fellow4U - Travel Application

## Introduction
Fellow4U is a travel companion application built with Flutter that connects travelers with local guides.

## Features
- **Explore**: Discover popular destinations and top-rated guides.
- **Trip Management**: Plan and track your journeys.
- **Real-time Chat**: Connect with guides and other travelers via text and voice messages.
- **Group Chat**: Create and manage group conversations.
- **Notifications**: Stay updated with trip status and offers.
- **Profile & Journey**: Showcase your travel memories and manage your account.

## Technology Stack
- **Framework**: Flutter (Dart)
- **State Management**: Provider
- **Service Layer**: Mock API Services for rapid prototyping

## Project Structure
- `lib/models`: Data structures (User, Trip, Chat, Notification, etc.)
- `lib/services`: Mock API layer for data handling.
- `lib/providers`: State management logic.
- `lib/screens`: UI screens and navigation logic.
- `lib/widgets`: Reusable UI components.

## API Endpoints (Simulated)
### Auth
- `POST /auth/login`
- `POST /auth/signup`
### Tours & Guides
- `GET /tours`
- `GET /guides/top`
### Chat & Friends
- `GET /chats`
- `POST /chats/{id}/messages`
- `POST /chats/{id}/voice`
- `GET /friends`
### Notifications
- `GET /notifications`
### User
- `GET /user/profile`
- `GET /user/journeys`

## Getting Started
1. Clone the repository.
2. Run `flutter pub get`.
3. Run `flutter run`.

---
*Developed by ngvu8925*
