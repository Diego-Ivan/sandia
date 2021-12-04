blueprints = custom_target('blueprints',
  input: files(
    'ui/TaskPage.blp',
    'ui/MainWindow.blp',
    'ui/ListItem.blp',
  ),
  output: '.',
  command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)

gnome = import('gnome')
sandia_sources += gnome.compile_resources('sandia-resources',
  'sandia.gresource.xml',
  source_dir: 'resources',
  c_name: app_name,
  dependencies: blueprints,
)
