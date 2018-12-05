SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.item :manage, 'Manage', '#' do |secondary|
      secondary.item :book, 'BOOKS', admin_books_path do |book|
        book.dom_class = 'nav nav-tabs'
        primary.dropdown = false
      end
      secondary.item :subjects, 'SUBJECTS', admin_subjects_path do |subject|
        subject.dom_class = 'nav nav-tabs'
        primary.dropdown = false
      end
    end
    primary.dom_class = 'nav navbar-nav'
    primary.dropdown = true
    primary.split = false
  end
end