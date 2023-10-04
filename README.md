# Administrate::Field::Button

**Administrate Field Button** is a custom field for the [Administrate](https://github.com/thoughtbot/administrate) gem that allows you to add customizable buttons to your resource views in the Administrate dashboard.

![Administrate Field Button Screenshot](/path/to/screenshot.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'administrate-field-button', github: 'jubilee2/administrate-field-button'
```

And then execute:

```shell
bundle install
```

## Usage

1. Add the custom field to your dashboard:

   ```ruby
   class MyResourceDashboard < Administrate::BaseDashboard
     # ...
     ATTRIBUTE_TYPES = {
       # ...
       my_button: Field::Button,
     }.freeze
     # ...
   end
   ```

2. In your model to add dummy button method
```ruby
  def my_button
  end
```

3. in the routes.rb add folloing post action
```ruby
  namespace :admin do
    resources :my_resource do
      member do
        post :my_button
      end
    end
  end
```

4. add action in comtroll doing what you want to do
```ruby
  def my_button
    find_resource.count = find_resource.count + 1
    flash[:notice] = 'action done'
    redirect_back fallback_location: root_path
  end
```

## Options

it's not implaciment yet

- `field_label`: Customize the label displayed above the button.

   ```ruby
   class MyResourceDashboard < Administrate::BaseDashboard
     ATTRIBUTE_TYPES = {
       # ...
       my_button: Field::Button.with_options(field_label: 'My Custom Button'),
     }.freeze
   end
   ```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/jubilee2/administrate-field-button](https://github.com/jubilee2/administrate-field-button).

## License

This gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Additional Resources

- [Administrate Documentation](https://github.com/thoughtbot/administrate)
- [Administrate Custom Fields](https://github.com/thoughtbot/administrate/blob/main/docs/custom_fields.md)

