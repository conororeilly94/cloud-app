module PropertiesHelper
    def property_thumbnail
        img = property.image.present
        image_tag img, class: "property-thumb"
    end

    def property_image property
        image_tag img, class: "property-image"
    end
end
