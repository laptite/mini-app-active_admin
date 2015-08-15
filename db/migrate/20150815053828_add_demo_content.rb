class AddDemoContent < ActiveRecord::Migration
  def up
    if table_exists?(:pages) && !Page.exists?(1)
      populate_cms_content
    end
  end

  def down
    ActiveRecord::Base.connection.execute("TRUNCATE pages")
    ActiveRecord::Base.connection.execute("TRUNCATE sections")
    `rm -rf #{ public_system_path }`
  end


  def public_system_path
    "#{Rails.root}/public/system/*"
  end

  def populate_cms_content
    pages_content.each_with_index do |data, idx|
      page = Page.create(
        title:     data[:title],
        subtitle:  data[:subtitle],
        published: data[:published]
      )
      data[:section].each do |section|
        page.sections.create(
          title:            section[:title],
          text_position:    section[:text_position],
          color:            section[:color],
          image: File.open( section[:image_path] )
        )
      end
    end
  end

  def pages_content
    [
      {
        title: 'Home Page 1',
        subtitle: 'Layout with Background Cover',
        published: 1,
        section: [
          {
            title: 'Cover',
            text_position: 'center',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_1_cover.jpg"
          }
        ]
      },
      {
        title: 'Home Page 2',
        subtitle: 'Layout with 3 sections',
        published: 0,
        section: [
          {
            title: 'Top Left',
            text_position: 'center-left-align',
            color: 'black',
            image_path: "#{Rails.root}/app/assets/images/home_page_2_top-left.jpg"
          },
          {
            title: 'Top Right',
            text_position: 'center-right-align',
            color: 'white',
            image_path: "#{Rails.root}/app/assets/images/home_page_2_top-right.jpg"
            },
          {
            title: 'Bottom',
            text_position: 'bottom-center',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_2_bottom.jpg"
          }
        ]
      },
      {
        title: 'Home Page 3',
        subtitle: 'Layout with 6 sections',
        published: 0,
        section: [
          {
            title: 'Top',
            text_position: 'top-center',
            color: 'white',
            image_path: "#{Rails.root}/app/assets/images/home_page_3_top.jpg"
          },
          {
            title: 'A',
            text_position: 'center-left-align',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_3_boxA.gif"
            },
          {
            title: 'B',
            text_position: 'center',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_3_boxB.gif"
          },
          {
            title: 'C',
            text_position: 'center',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_3_boxC.gif"
          },
          {
            title: 'D',
            text_position: 'center-right-align',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_3_boxD.gif"
            },
          {
            title: 'Bottom',
            text_position: 'bottom-center',
            color: 'yellow',
            image_path: "#{Rails.root}/app/assets/images/home_page_3_bottom.jpg"
          }
        ]
      }
    ]
  end
end
