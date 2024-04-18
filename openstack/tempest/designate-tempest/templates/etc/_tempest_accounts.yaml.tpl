- username: 'admin'
  tenant_name: 'admin'
  password: {{ .Values.tempestAdminPassword | quote }}
  project_name: 'admin'
  types:
   - admin
  roles:
   - admin
   - primary
   - dns_admin
- username: 'tempestuser1'
  tenant_name: 'tempest1'
  password: {{ .Values.tempestAdminPassword | quote }}
  project_name: 'tempest1'
  types:
   - primary
- username: 'tempestuser2'
  tenant_name: 'tempest2'
  password: {{ .Values.tempestAdminPassword | quote }}
  project_name: 'tempest2'
  types:
    - primary