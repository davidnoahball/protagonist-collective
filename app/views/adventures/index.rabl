collection @adventures
attributes :id, :title, :critical_size
node(:root) {|adventure| adventure.root}
node(:page_count) {|adventure| adventure.page_count}