# Guard::ImageOptim [![Gem Version](https://badge.fury.io/rb/guard-image_optim.svg)](http://badge.fury.io/rb/guard-image_optim)
Guard::ImageOptim automatically optimizes your images with image_optim.

## Installation
Add to your `Gemfile`:
```ruby
gem 'guard-image_optim'
```

Require in your `Guardfile`:
```ruby
require "guard/image_optim"
```

Or, add the default Guard::MtHaml template to your `Guardfile` by running:
```bash
$ guard init image_optim
```

## Usage

```ruby
###
# Sample Guardfile block for Guard::ImageOptim
#
# :input         ("images") set input image directory
# :nice          (10)       nice level for image_optim gem
# :notifications (true)     toggle guard notifications
# :run_at_start  (false)    optimize images when guard starts
# :pngout        (false)    toggle pngout for image_optim gem
# :svgo          (false)    toggle svgo for image_optim gem
###
guard :image_optim, :input => "images"
```

## Authors
[Ezekiel Gabrielse](http://ezekielg.com)

## License
Graphite is available under the [MIT](http://opensource.org/licenses/MIT) license.
