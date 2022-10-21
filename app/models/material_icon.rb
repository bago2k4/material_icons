#
# This class help the creation of material icons in the UI.
#
class MaterialIcon
  # To use content_tag
  include ActionView::Helpers::TagHelper

  @@rotations = %w(45 90 135 180 225 270 315)
  @@icon_styles = %w(outlined round sharp twotone)

  #
  # Reset will set all variables to nil
  #
  def reset
    @icon, @rotation, @size, @html, @style, @icon_style, @icon_names, @tooltip_copy, @click_action, @css_class, @id = [nil] * 11
    self
  end

  #
  # Define rotate methods
  #
  %w(flip_horizontal flip_vertical).append(*self.class_variable_get("@@rotations").map { |x| "r#{x}" }).each do |rotation|
    define_method(rotation) do
      @rotation = " #{rotation.gsub('_', '-')}"
      self
    end
  end

  #
  # Define size methods
  #
  %w(md_18 md_24 md_36 md_48).each do |size|
    define_method(size) do
      @size = " #{size.gsub('_', '-')} "
      self
    end
  end

  #
  # Define style methods
  #
  @@icon_styles.each do |icon_style|
    define_method(icon_style) do
      @icon_style = " #{icon_style}"
      self
    end
  end

  #
  # Set the shape of the icon you want to use
  #
  # == Paremeters:
  # name::
  #    String or symbol with icon name
  #
  # == Returns:
  # MaterialIcon instance
  #
  def shape(name)
    @icon = name.to_s
    self
  end

  #
  # Set the id of the :i tag
  #
  # == Paremeters:
  # id::
  #    String of the id
  #
  # == Returns:
  # MaterialIcon instance
  #
  def id(id_selector)
    @id = id_selector
    self
  end

  #
  # Add a CSS class to :i tag
  #
  # == Paremeters:
  # css_class::
  #    String with CSS classes
  #
  # == Returns:
  # MaterialIcon instance
  #
  def css_class(css_class = '')
    @css_class = " #{css_class}"
    self
  end

  #
  # Add CSS properties to :i tag
  #
  # == Paremeters:
  # style::
  #    String with CSS rules
  #
  # == Returns:
  # MaterialIcon instance
  #
  def style(css_style = '')
    @style = css_style
    self
  end

  #
  # Add CSS properties to :i tag
  #
  # == Paremeters:
  # title::
  #    String with CSS rules
  #
  # == Returns:
  # MaterialIcon instance
  #
  def tooltip_copy(copy = '')
    @tooltip_copy = copy
    self
  end

  #
  # Add onclick action to the HTML tag
  #
  # == Paremeters:
  # click_action::
  #    String with the click action
  #
  # == Returns:
  # MaterialIcon instance
  #
  def click(click_action = '')
    @click_action = click_action
    self
  end

  #
  # Add HTML options to :i tag.
  #
  # == Paremeters:
  # html::
  #   Hash with options to add to :i tag. For example:
  #     { data: { id: 1 } }
  #
  # == Returns:
  # MaterialIcon instance
  #
  def html_attrs(html = {})
    @html = html
    self
  end

  #
  # Add style class to the :i tag
  #
  # == Paremeters:
  # style::
  #    String with style name, one of outlined round sharp twotone, any other value will be ignored
  #
  # == Returns:
  # MaterialIcon instance
  #
  def icon_style(style = '')
    @icon_style = " #{style}" if style.present? && @@icon_styles.include?(style)
    self
  end

  #
  # Create the HTML code for the icon
  #
  # == Returns:
  # Safe string
  #
  def to_s
    # Sanitize html
    @html = @html.nil? || !@html.is_a?(Hash) ? {} : @html

    # Create the icon
    content_tag(:i, "",
                @html.merge(
                  style: @style,
                  title: @tooltip_copy,
                  onclick: @click_action,
                  id: @id,
                  class: "material-icons#{@icon_style}#{@size}#{@rotation}#{@css_class} #{@icon}"))
  end

  # Fix #13. Some Rails methods uses to_str instead of to_s. In this case, to_str is handled
  # by method_missing so it's returning the same instance and the method are failing
  alias_method :to_str, :to_s

  #
  # Some methods require to_ary to be defined. We return nil in this method to avoid this class
  # to be threated as an Array
  #
  # == Returns
  # Nil
  #
  def to_ary
    nil
  end

  # def self.icon_names
  #   asd = []
  #   YAML.safe_load(File.read(__dir__ + '/../../icons/versions.yml'))['icons'].to_a.each do |icon_name|
  #     asd << "Will create method for: #{icon_name}"
  #   end
  #   asd
  # end

  def self.icon_names
    YAML.safe_load(File.read(__dir__ + '/../../icons/versions.yml'))['icons']
  end

  self.icon_names.each do |icon_name|
    define_method(icon_name.to_s) do
      @icon = icon_name.to_s
      self
    end
  end

  def self.rotations
    %w(r90 r180 r270 flip_horizontal flip_vertical)
  end
end
