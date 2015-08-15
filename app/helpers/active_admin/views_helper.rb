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

  def homepage_A(object)
    "<div class=\"grid-container\">
      <a href=\"#{ edit_admin_section_path(object.sections[0]) }\">
        <div class=\"full-cover\">
          <span>COVER IMAGE</span>
        </div>
      </a>
    </div>".html_safe
  end

  def homepage_B(object)
    "<div class=\"grid-container\">
      <div class=\"box-wrapper\">
        <a href=\"#{ edit_admin_section_path(object.sections[0]) }\">
          <div class=\"half-width bbr-0\">
            <span>top-left</span>
          </div>
        </a>
        <a href=\"#{ edit_admin_section_path(object.sections[1]) }\">
          <div class=\"half-width bb-0\">
            <span>top-right</span>
          </div>
        </a>
      </div>
      <a href=\"#{ edit_admin_section_path(object.sections[2]) }\">
        <div class=\"full-width\">
          <span>bottom</span>
        </div>
      </a>
    </div>".html_safe
  end
  
  def homepage_C(object)
    "<div class=\"grid-container\">
      <a href=\"#{ edit_admin_section_path(object.sections[0])}\">
        <div class=\"full-width bb-0\">
          <span>top</span>
        </div>
      </a>
      <div class=\"box-wrapper\">
        <a href=\"#{ edit_admin_section_path(object.sections[1]) }\">
          <div class=\"quarter-width bbr-0\">
            <span>A</span>
          </div>
        </a>
        <a href=\"#{ edit_admin_section_path(object.sections[2]) }\">
          <div class=\"quarter-width bbr-0\">
            <span>B</span>
          </div>
        </a>
        <a href=\"#{ edit_admin_section_path(object.sections[3]) }\">
          <div class=\"quarter-width bbr-0\">
            <span>C</span>
          </div>
        </a>
        <a href=\"#{ edit_admin_section_path(object.sections[4]) }\">
          <div class=\"quarter-width bb-0\">
            <span>D</span>
          </div>
        </a>
      </div>
      <a href=\"#{ edit_admin_section_path(object.sections[5]) }\">
        <div class=\"full-width\">
          <span>bottom</span>
        </div>
      </a>
    </div>".html_safe
  end

end