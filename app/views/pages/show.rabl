object @page
node(:parent_path) {|page| page.parent_path}
node(:adventure_root_path) {|page| page.adventure.root_path}
node(:adventure_title) {|page| page.adventure.title}
node(:adventure_id) {|page| page.adventure.id}
node(:body) {|page| page.body}
node(:user) {|page| page.user}
node(:user_path) {|page| page.user_path}
node(:user_name) {|page| page.user_name}
node(:child1_id) {|page| page.child1_id}
node(:child2_id) {|page| page.child2_id}
node(:child1_path) {|page| page.child1_path}
node(:child2_path) {|page| page.child2_path}
node(:choice1) {|page| page.choice1}
node(:choice2) {|page| page.choice2}
node(:end) {|page| page.end}