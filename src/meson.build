sandia_sources += [
  'Application.vala',
  'MainWindow.vala',
  'ListItem.vala',
  'TaskPage.vala',
]

executable(app_name, sandia_sources,
  vala_args: [
    '--target-glib=2.50',
    '--vapidir', vapi_dir,
    '--enable-experimental'
  ],
  c_args: [
    '-DVERSION="' + meson.project_version() + '"',
    '-DGETTEXT_PACKAGE="' + app_name + '"',
    '-DGNOMELOCALEDIR="' + get_option('prefix') / get_option('localedir') + '"',
    '-DAPP_ID="' + app_id + '"',
  ],
  dependencies: sandia_deps,
  install: true
)
