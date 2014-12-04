module.exports = (grunt) ->
  grunt.initConfig
    phoneIP: '192.168.1.35',
    logs: '--logs',
    coffee:
      glob_to_multiple:
        expand: true,
        flatten: true,
        cwd: 'src/js',
        src: ['*.coffee'],
        dest: 'src/js',
        ext: '.js'
    shell:
      buildAndInstall:
        command: 'pebble build; pebble install --phone <%= phoneIP %> <%= logs %>',
        options:
          stdout: true,
          stderr: true

  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.registerTask 'default', ['coffee', 'shell']
