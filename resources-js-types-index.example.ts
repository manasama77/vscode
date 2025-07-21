// resources/js/types/index.ts
export interface User {
  id: number;
  name: string;
  email: string;
  email_verified_at: string;
  created_at: string;
  updated_at: string;
}

export type PageProps<
  T extends Record<string, unknown> = Record<string, unknown>
> = T & {
  auth: {
    user: User;
  };
};

// Common API Response Types
export interface ApiResponse<T = any> {
  data: T;
  message: string;
  status: 'success' | 'error';
  errors?: Record<string, string[]>;
}

// Laravel Pagination Types
export interface PaginationLink {
  url: string | null;
  label: string;
  active: boolean;
}

export interface PaginationMeta {
  current_page: number;
  from: number;
  last_page: number;
  links: PaginationLink[];
  path: string;
  per_page: number;
  to: number;
  total: number;
}

export interface PaginatedData<T> {
  data: T[];
  links: {
    first: string;
    last: string;
    prev: string | null;
    next: string | null;
  };
  meta: PaginationMeta;
}

// Form Types
export interface ValidationErrors {
  [key: string]: string[];
}

export interface InertiaFormProps {
  data: any;
  isDirty: boolean;
  errors: ValidationErrors;
  hasErrors: boolean;
  processing: boolean;
  progress: any;
  wasSuccessful: boolean;
  recentlySuccessful: boolean;
}
