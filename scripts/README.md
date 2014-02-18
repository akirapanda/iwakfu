#HOW TO INIT ITEMS DATABASE
1.run 'extract_items_from_propertites_file.rb', extract all items infos from the i18n properties file of the game
2.run 'init_items_from_items_lits', import items list file which is extracted from the game into database tablespace.
3.run 'fetch_info_from_element.rb' & 'fetch_stat_from_element.rb' to grape the detail info from www.wakfu-element.com