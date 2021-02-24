module PropertiesHelper
    def property_thumbnail
        img = property.image.present
        image_tag img, class: "property-thumb"
    end
end
