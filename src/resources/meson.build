# blueprints = custom_target('blueprints',
#   input: files(
#     'ui/TaskPage.blp',
#     'ui/MainWindow.blp',
#     'ui/ListItem.blp',
#   ),
#   output: '.',
#   command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
# )

sandia_resource_files = files('sandia.gresource.xml')

gnome = import('gnome')
sandia_sources += gnome.compile_resources('sandia-resources',
  sandia_resource_files,
  source_dir: 'resources',
  c_name: app_name,
  # dependencies: blueprints,
)
