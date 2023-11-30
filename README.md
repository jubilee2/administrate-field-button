# Administrate::Field::Button

**Administrate Field Button** is a custom field for the [Administrate](https://github.com/thoughtbot/administrate) gem that enhances your Administrate dashboard by adding customizable buttons to your resource views.

![Administrate Field Button Screenshot](/path/to/screenshot.png)

## Installation

To use this gem in your project, follow these steps:

1. Add the gem to your application's Gemfile:

```ruby
gem 'administrate-field-button', github: 'jubilee2/administrate-field-button'
```

2. Run the following command to install the gem:

```shell
bundle install
```

## Usage

### 1. Add the Custom Field

In your dashboard definition, add the custom field to enable the button:

```ruby
class MyResourceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    # ...
    my_button: Field::Button,
    my_button2: Field::Button.with_options(
      label_of_button: 'Foo action',
      method: :post,
      confirm: false
    ),

  }.freeze
  # ...
end
```

### 2. Define a Dummy Button Method in Your Model

Create a dummy button method in your model to enable the button:

```ruby
class Book < ApplictionRecord
  attr_reader :my_button, :my_button2
end
```

### 3. Configure the Route

In your `routes.rb` file, configure a POST action for the button:

```ruby
namespace :admin do
  resources :my_resource do
    member do
      post :my_button
    end
  end
end
```

### 4. Implement the Button Action

In your controller, implement the action for the button. Customize it to perform the desired functionality:

```ruby
def my_button
  # Your custom logic here
  flash[:notice] = 'Action done successfully'
  redirect_back fallback_location: root_path
end
```

## Contributing

We welcome bug reports and pull requests on [GitHub](https://github.com/jubilee2/administrate-field-button). Please feel free to contribute to the project.

## License

This gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Additional Resources

For more information on Administrate and custom fields, refer to the following resources:

- [Administrate Documentation](https://github.com/thoughtbot/administrate)
- [Administrate Custom Fields](https://github.com/thoughtbot/administrate/blob/main/docs/custom_fields.md)

