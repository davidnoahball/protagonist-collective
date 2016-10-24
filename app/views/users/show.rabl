object @user
attributes :id, :name
child(:pages) {|m| 
  collection @user.pages, :object_root => false
  node(:path) {|page| page.path}
  node(:adventure_title) {|page| page.adventure.title}
  node(:choice_text) {|page| page.choice_text}
}