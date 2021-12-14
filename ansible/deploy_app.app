---
- hosts:  servers
  become: true
  vars:
    project_location: /srv/long_running_python_process
    program_name: long_running_process
    project_folder: /var/log/supervisor

  tasks:
    - name: create supervisor directory
      file:
        path: {{ project_folder }}
        state: directory

    - name: restart supervisord
      service: name=supervisord state=restarted

    - name: "supervisorctl restart {{program_name}}"
      command: "supervisorctl restart {{program_name}}"
