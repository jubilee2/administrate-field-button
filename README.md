# Administrate::Field::Button

## Overview
**Administrate Field Button** enhances your [Administrate](https://github.com/thoughtbot/administrate) dashboard with customizable buttons. This gem provides a flexible way to add buttons to your resource views.

## Installation
### Step 1: Add Gem to Gemfile
```Ruby
gem 'administrate-field-button', github: 'jubilee2/administrate-field-button'
```

### Step 2: Install Gem
```Bash
bundle install
```

## Usage
### Step 1: Add Custom Field
```Ruby
class MyResourceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    my_button: Field::Button,
    my_button2: Field::Button.with_options(
      label_of_button: 'Foo action',
      method: :post,
      branch: ->(field) { field.resource.active? },
      confirm: false
    )
  }.freeze
end
```

### Step 2: Define Dummy Button Method
```Ruby
class Book < ApplicationRecord
  attr_reader :my_button, :my_button2
end
```

### Step 3: Configure Route
```Ruby
namespace :admin do
  resources :my_resource do
    member do
      post :my_button
    end
  end
end
```

### Step 4: Implement Button Action
```Ruby
def my_button
  # Custom logic here
  flash[:notice] = 'Action done successfully'
  redirect_back fallback_location: root_path
end
```

## Customization Options
### `Field::Button` Options

- **label_of_button** (String): Button label.

- **method** (Symbol): HTTP method (:post, :put, :delete). Default: :post.

- **branch** (Proc): Conditional display based on resource attributes.

- **confirm** (Boolean): Confirmation dialog. Default: `false`.

## Example

```Ruby
my_button: Field::Button.with_options(
  label_of_button: 'Custom Action',
  method: :patch,
  branch: ->(field) { field.resource.published? && field.resource.approved? },
  confirm: true
)
```

## Contributing

We welcome bug reports and pull requests on [GitHub](https://github.com/jubilee2/administrate-field-button).

## License

This gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Additional Resources

For more information on Administrate and custom fields, refer to the following resources:

- [Administrate Documentation](https://github.com/thoughtbot/administrate)
- [Administrate Custom Fields](https://github.com/thoughtbot/administrate/blob/main/docs/custom_fields.md)

