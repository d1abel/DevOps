Lighthouse
=========

Installs Nginx and deploys [Lighthouse](https://github.com/VKCOM/lighthouse)

Requirements
------------

* Ansible >= 2.7

Role Variables
--------------

| Name           | Default Value | Description                                     |
| ---------------| ------------- |-------------------------------------------------|
| 'lighthouse_path' | /var/www/lighthouse | Path where lighthouse will be stored            |

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - lighthouse

License
-------

MIT

Author Information
------------------

Created by Vitaly Kolchin