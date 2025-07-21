# Laravel Development Workspace Instructions

<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

## Project Context

This is a Laravel development workspace optimized for modern full-stack development with the following technology stacks:

### Primary Stacks:

1. **Laravel + Blade + TailwindCSS + Vite.js + DaisyUI/FlyonUI + jQuery/Vanilla JS**
2. **Laravel + Blade + Bootstrap 5 + Vite.js + jQuery/Vanilla JS**
3. **Laravel + Inertia.js + React (TypeScript) + TailwindCSS + Vite.js**
4. **Laravel + Inertia.js + React (TypeScript) + TailwindCSS + Vite.js + ShadCN UI**

## Development Guidelines

### Laravel Best Practices

- Use Laravel conventions for naming (PascalCase for classes, snake_case for database fields, kebab-case for routes)
- Follow PSR-12 coding standards for PHP
- Use Eloquent relationships and query optimization
- Implement proper validation using Form Requests
- Use Laravel's built-in features (caching, queues, events, etc.)

### Frontend Development

- Use TypeScript for React components when working with Inertia.js
- Follow React functional component patterns with hooks
- Use TailwindCSS utility classes for styling
- Implement responsive design principles
- Optimize for performance with proper component splitting

### Code Organization

- Keep controllers thin, use Services/Actions for business logic
- Use Resource classes for API responses
- Implement proper error handling and logging
- Follow Single Responsibility Principle
- Use dependency injection where appropriate

### Database

- Use migrations for all database changes
- Create proper indexes for performance
- Use database seeders for test data
- Follow Laravel naming conventions for tables and columns

### Security

- Always validate user input
- Use CSRF protection for forms
- Implement proper authorization with Gates/Policies
- Sanitize data before database operations
- Use Laravel's built-in authentication features

### Testing

- Write feature tests for important workflows
- Use factories for test data generation
- Mock external services in tests
- Test both happy path and edge cases

### Performance

- Use eager loading to avoid N+1 queries
- Implement proper caching strategies
- Optimize database queries
- Use Vite for asset compilation and optimization
- Minimize bundle sizes for frontend assets

## File Structure Preferences

- Controllers in `app/Http/Controllers`
- Models in `app/Models`
- Services in `app/Services`
- Resources in `app/Http/Resources`
- Form Requests in `app/Http/Requests`
- Middleware in `app/Http/Middleware`
- React components in `resources/js/Components` (for Inertia.js)
- Pages in `resources/js/Pages` (for Inertia.js)
- Blade views in `resources/views`

## Specific Technology Integration

### When using Inertia.js:

- Use the `@inertiajs/react` package for React integration
- Implement proper TypeScript types for page props
- Use Inertia's form helper for form handling
- Handle client-side routing with Inertia router

### When using TailwindCSS:

- Prefer utility classes over custom CSS
- Use responsive design utilities
- Implement dark mode support when needed
- Use Tailwind's component extraction for repeated patterns

### When using DaisyUI/FlyonUI:

- Leverage component classes for rapid development
- Maintain consistency with design system
- Customize theme colors in tailwind.config.js

### When using ShadCN UI:

- Follow component composition patterns
- Use proper TypeScript integration
- Implement accessibility features
- Maintain design system consistency

## Additional Notes

- Always consider accessibility in UI implementations
- Use semantic HTML elements
- Implement proper error boundaries in React
- Use Laravel's localization features for multi-language support
- Follow RESTful API conventions
- Implement proper logging for debugging and monitoring
