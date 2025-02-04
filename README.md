[![Gem Version](https://badge.fury.io/rb/material_icons.svg)](http://badge.fury.io/rb/material_icons) [![Build Status](https://github.com/Angelmmiguel/material_icons/workflows/Ruby/badge.svg)](https://github.com/Angelmmiguel/material_icons/actions?query=workflow%3ARuby)

![Material Icons for Rails](https://raw.githubusercontent.com/Angelmmiguel/material_icons/master/material.png)

# Material Icons for Rails

[Material Design Icons](https://google.github.io/material-design-icons/) is a **+900 set of icons** based on Material Design guidelines. You can check all the icons in the [official site](https://material.io/icons/).

**This gem helps you to add this fantastic icon collection to your Rails projects easily**. I keep the gem updated so you always will have the latest icons in your project.

## Google Material Icons v2.2.2

Google updates Material Icons to [v2.2.2](https://github.com/google/material-design-icons/releases/tag/2.2.2). It's include 41 new icons!

# Installation

To install the gem, add this line to your `Gemfile`:

	gem 'material_icons'

Then, execute `bundle install`.

# CSS

In your `app/assets/stylesheets/application.css.erb` file you need to reference material icons CSS.

Add this line at top of `application.css`:

```css
/*
*= require material_icons
*/
```

**NOTE**: Depending on the comment style of `application.css`, you may need to add `//= require material_icons` instead of the previous line. See [Rails Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html#manifest-files-and-directives) for more info.

These files provide multiple CSS classes to use in your views. Main classes are:

	.material-icons, .mi

Some CSS classes are provided too:

```
/* Size */
.md-18
.md-24
.md-36
.md-48

/* Color */
.md-dark
.md-light

/* Rotation */
.r90
.r180
.r270
.flip-horizontal
.flip-vertical
```

Don't forget to see material_icons.css.erb ;).

# Views

Google Material Icons uses a feature called ligatures. We can define the icon in the text of the HTML tag. Go to [Google Guide](https://google.github.io/material-design-icons/#using-the-icons-in-html) to get more info.

An example of icon is:

```html
<i class="material-icons">face</i>
<i class="material-icons md-36">face</i>
```

## Helpers

Material Icons provide two helpers to build the HTML code of icons. The methods are `material_icon` and `mi`. These helpers use cascade style to set the icon and options. Using same example:

```
<%= material_icon.face %>
# <i class="material-icons">face</i>

<%= material_icon.face.md_36 %>
# <i class="material-icons md-36">face</i>

# This is a special case because the icon name starts with a number. Only
# 3d_rotation has this trouble.
<%= material_icon.three_d_rotation.md_36 %>
# <i class="material-icons md-36">3d_rotation</i>

# Rotation and custom css class
<%= mi.face.r90.css_class('my_class') %>
# <i class="material-icons r90 my_class">face</i>

# Custom css and data attributes
<%= mi.face.css_class('my_class').html_attrs(data: {id: 1}) %>
# <i data-id="1" class="material-icons my_class">face</i>
```

Allowed methods are:

```
# Rotation methods
r45
r90
r135
r180
r225
r270
r315
flip_horizontal
flip_vertical

# Size methods
md_18
md_24
md_36
md_48

# Add some classes to the icon
css_class('classes')

# Add style to the icon
style('margin-top: 5px;')

# Add some HTML attributes to an icon. This method receive a Hash
html_attrs({ data: { id: 1 } })

# Add the id
id('element-id')

# Add onclick
click('javascript: code();)

# Add a tooltip
tooltip_copy('My tooltip here')

# Set the icon style
icon_style('outlined') // accept only: outlined, round, sharp and twotone
```

Remember this is a helper, you always can use HTML syntax ;).

# Compatibility

Ligature feature requires a supported browser:

Browser | Version
---- | ----
Google Chrome | >= 11
Mozilla Firefox | >= 3.5
Apple Safari | >= 5
Microsoft IE | >= 10
Opera | >= 15
Apple MobileSafari | >= iOS 4.2
Android Browser | >= 3.0

You can find the current browser support in [_can I use?_](https://caniuse.com/kerning-pairs-ligatures).

# Common issues

## Slim templating engine

If you are using [Slim templating engine](http://slim-lang.com/) in your Rails application, use double equal `==` method to render icons or the content won't be marked as HTML safe. We are working on this issue, because we use `content_tag` and it sets the text as HTML safe (see [ActionView::Helpers::TagHelper line 146](https://github.com/rails/rails/blob/4-2-stable/actionview/lib/action_view/helpers/tag_helper.rb#L146)).

```
p.text
  == material_icon.search.md_18
```

Reference [#9](https://github.com/Angelmmiguel/material_icons/issues/9)

## Couldn't find file 'material_icons'

```
couldn't find file 'material_icons' with type 'application/javascript'
```

This error is related with the asset compilation of Rails. To fix it, just follow these steps:

* Confirm that you [required the Material Icons CSS in your main CSS file](#CSS)
* Check and remove any similar line of code from `app/assets/javascripts/application.js.erb`
* Restart your rails server.

Reference [#10](https://github.com/Angelmmiguel/material_icons/issues/10)

# Tested on

Tested with [GitHub Actions](https://github.com/Angelmmiguel/material_icons/actions?query=workflow%3ARuby).

Ruby versions:

* 2.6
* 2.7
* 3.0
* 3.1

Rails versions:

* 5.2
* 6.0
* 6.1
* 7.0

# They are using Material icons for Rails :)

* [Materialup.com](http://www.materialup.com): a big community to share, discover and learn about Material Design.
* [Easy Bills](https://www.easybills.io): a free tool to manage your finances.
* [Notebook.ai](https://www.notebook.ai/): your digital notebook is here. Notebook.ai grows with your ideas and collaborates back with you.

# License

Google Material Icons are under [Apache License v2.0](http://www.apache.org/licenses/LICENSE-2.0). _We'd love attribution in your app's about screen, but [it's not required](https://github.com/google/material-design-icons#license)_.

Material Icons gem is released under the MIT license. Copyright [Angel M Miguel](https://angel.kiwi)
