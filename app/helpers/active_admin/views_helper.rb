module ActiveAdmin::ViewsHelper

  def homepage_layout(object)
    case object.try(:id)
    when 1
      homepage_A(object)
    when 2
      homepage_B(object)
    when 3
      homepage_C(object)
    end
  end

  # { edit_cms_section_path(object.sections[0]) }
  def homepage_A(object)
    "<div class=\"grid-container\">
      <a href=\"#\">
        <div class=\"full-cover\">
          <span>COVER IMAGE</span>
        </div>
      </a>
    </div>".html_safe
  end

  def homepage_B(object)
    "<div class=\"grid-container\">
      <div class=\"box-wrapper\">
        <a href=\"#\">
          <div class=\"half-width bbr-0\">
            <span>top-left</span>
          </div>
        </a>
        <a href=\"#\">
          <div class=\"half-width bb-0\">
            <span>top-right</span>
          </div>
        </a>
      </div>
      <a href=\"#\">
        <div class=\"full-width\">
          <span>bottom</span>
        </div>
      </a>
    </div>".html_safe
  end
  
  def homepage_C(object)
    "<div class=\"grid-container\">
      <a href=\"#\">
        <div class=\"full-width bb-0\">
          <span>top</span>
        </div>
      </a>
      <div class=\"box-wrapper\">
        <a href=\"#\">
          <div class=\"quarter-width bbr-0\">
            <span>A</span>
          </div>
        </a>
        <a href=\"#\">
          <div class=\"quarter-width bbr-0\">
            <span>B</span>
          </div>
        </a>
        <a href=\"#\">
          <div class=\"quarter-width bbr-0\">
            <span>C</span>
          </div>
        </a>
        <a href=\"#\">
          <div class=\"quarter-width bb-0\">
            <span>D</span>
          </div>
        </a>
      </div>
      <a href=\"#\">
        <div class=\"full-width\">
          <span>bottom</span>
        </div>
      </a>
    </div>".html_safe
  end

end