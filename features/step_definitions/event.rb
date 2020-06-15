Quand("un visiteur ouvre la page d'accueil du site") do
  visit "/"
end

Quand("un visiteur ouvre la page d‘accueil d‘un site dont l‘adresse commence par {string}") do |portfolio|
  visit "/"
end

Quand("on sélectionne la rubrique {string}") do |topic|
  click_on topic
end

Quand ("l'utilisateur crée un item {string} dans le corpus {string}") do |name, corpus|
  click_on corpus
  expect(page).to have_content("undefined")
  fill_in placeholder: 'Ajouter un attribut et une valeur...', with: "name:#{name}"
  click_on 'validateButton-undefined'
end

Quand ("l'utilisateur sélectionne {string} entre la rubrique {string} et la rubrique {string}") do |union, topic1, topic2|
  within('.Status') do
    find(:xpath, "//span[contains(., #{topic1})]/following-sibling::button", text: union, match: :first).click
  end
end

Quand("on choisit la rubrique {string}") do |topic|
  click_on topic
end

Quand("l'utilisateur indique {string} comme valeur de l'attribut {string}") do |value, attribute|
  within '.Attributes' do
    fill_in placeholder: 'Ajouter un attribut et une valeur...', with: "#{attribute}:#{value}"
    click_on class: 'ValidateButton' 
  end
end

Quand("l'utilisateur indique {string} comme nouvelle rubrique du point de vue {string}") do |topic, viewpoint|
  within '.Viewpoint', text: viewpoint do
    fill_in placeholder: 'Ajouter une rubrique...', with: topic
    click_on class: 'ValidateButton'
    click_on class: 'ValidateButton'
  end
end

Quand("l'utilisateur indique {string} pour la catégorie {string} du point de vue {string}") do |pattern, topic, viewpoint|
  within '.Viewpoint', text: viewpoint do
    find('input').send_keys pattern
    click_link(topic, href: nil)
    click_on class: 'ValidateButton'
  end
end

Quand("l'utilisateur choisit l'item {string} dans le bloc Items ayant le même nom") do |item|
  click_on item
end

Quand("l'utilisateur clique sur le marqueur {string}") do |marker|
  find(:xpath, '//*[@id="gmimap0"]/area', visible: false).trigger("click")
end