object @page
node(:words) {|page| page.class.word_count}
node(:pages) {|page| page.class.count}