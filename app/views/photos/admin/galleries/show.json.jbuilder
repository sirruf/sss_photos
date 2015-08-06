json.array! @gallery.pictures do |picture|
  json.id picture.id
  json.name picture.name || picture.image_name
  json.url picture.image.url
end
