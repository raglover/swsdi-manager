module ApplicationHelper

## This is a helper for adding fields to dynamic forms. Thanks RBates!

    def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name, '#', class: "add-fields button tiny primary", data: {id: id, fields: fields.gsub("\n", "")})
    end

## This is a helper for displaying the user avatar correctly.

    def display_user_avatar(user)
	binding.pry
        if !user.fb_image.blank?
            image_tag(user.fb_image)
        elsif !user.image.nil?
            image_tag(user.image_url(:thumb))
        else
            image_tag(user.default_url, width: 150, height: 150)
        end
    end


## A Helper for presenting spirit animal info

    def spirit_animal(user)
        if !user.spirit_animal.blank?
            user.spirit_animal.titleize
        else
            if user == current_user || user == current_admin
                return "You're Boring!"
            else
                return "Ughhh, Boring!"
            end
        end
    end

## Returns Experience level

    def experience_level(app)
        if app.has_competed
            return "Clinic"
        else
            return "Lab"
        end
    end

## A Helper for converting booleans into Yes or No answers

    def yes_no(bool_val)
        if bool_val
            return "Yes"
        else
            return "No"
        end
    end

    def check_for_content(content)
        if !content || content == ""
            return "None"
        else
            return content
        end
    end

## Defining some collections as helpers for use in forms. There's probably a better way.

    def divisions
        ["Novice", "JV", "Varsity/Open"]
    end    

    def outrounds
        ["Triples", "Doubles", "Octos", "Quarters", "Semis", "Finals"]
    end

    def pmt_opts
        ["Credit Card", "Check", "Cash", "Financial Aid"]
    end
    
    def us_states
        [
        ['Alabama', 'AL'],
        ['Alaska', 'AK'],
        ['Arizona', 'AZ'],
        ['Arkansas', 'AR'],
        ['California', 'CA'],
        ['Colorado', 'CO'],
        ['Connecticut', 'CT'],
        ['Delaware', 'DE'],
        ['District of Columbia', 'DC'],
        ['Florida', 'FL'],
        ['Georgia', 'GA'],
        ['Hawaii', 'HI'],
        ['Idaho', 'ID'],
        ['Illinois', 'IL'],
        ['Indiana', 'IN'],
        ['Iowa', 'IA'],
        ['Kansas', 'KS'],
        ['Kentucky', 'KY'],
        ['Louisiana', 'LA'],
        ['Maine', 'ME'],
        ['Maryland', 'MD'],
        ['Massachusetts', 'MA'],
        ['Michigan', 'MI'],
        ['Minnesota', 'MN'],
        ['Mississippi', 'MS'],
        ['Missouri', 'MO'],
        ['Montana', 'MT'],
        ['Nebraska', 'NE'],
        ['Nevada', 'NV'],
        ['New Hampshire', 'NH'],
        ['New Jersey', 'NJ'],
        ['New Mexico', 'NM'],
        ['New York', 'NY'],
        ['North Carolina', 'NC'],
        ['North Dakota', 'ND'],
        ['Ohio', 'OH'],
        ['Oklahoma', 'OK'],
        ['Oregon', 'OR'],
        ['Pennsylvania', 'PA'],
        ['Puerto Rico', 'PR'],
        ['Rhode Island', 'RI'],
        ['South Carolina', 'SC'],
        ['South Dakota', 'SD'],
        ['Tennessee', 'TN'],
        ['Texas', 'TX'],
        ['Utah', 'UT'],
        ['Vermont', 'VT'],
        ['Virginia', 'VA'],
        ['Washington', 'WA'],
        ['West Virginia', 'WV'],
        ['Wisconsin', 'WI'],
        ['Wyoming', 'WY']
        ]
    end

end
