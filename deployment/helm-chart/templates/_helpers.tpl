{{- define "shipment.name" -}}
{{- printf "%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "shipment.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "shipment.labels" }}
helm.sh/chart: {{ include "shipment.chart" . }}
app.kubernetes.io/name: {{ include "shipment.name" . }}
ofload.io/service-name: {{ include "shipment.name" . }}
{{ include "shipment.selectorLabels" . }}
{{- end }}

{{- define "shipment.selectorLabels" }}
app.kubernetes.io/name: {{ include "shipment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "shipment.app.variables" }}
- name: APP_DEBUG
  value: "false"
- name: APP_ENV
  value: "{{ .Values.env.vars.appEnv }}"
- name: APP_KEY
  value: "base64:EyhkDJabb/+VZ2pj8B9itzOBsa2MZzwUJmECudbtISM="
- name: DB_CONNECTION
  value: "pgsql"
- name: DB_DATABASE
  value: "shipment"
- name: DB_USERNAME
  value: "{{ .Values.env.vars.postgresDbUser }}"
- name: DB_HOST
  value: "{{ .Values.env.vars.postgresDbHost }}"
- name: NEWRELIC_APP_NAME
  value: "{{ .Values.env.vars.appEnv }}-shipment-service"
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ include "shipment.name" . }}
      key: "aws-secret"
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: {{ include "shipment.name" . }}
      key: "aws-key"
- name: NEWRELIC_KEY
  valueFrom:
    secretKeyRef:
      name: {{ include "shipment.name" . }}
      key: "newrelic-key"
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "shipment.name" . }}
      key: "postgres-db-password"
{{- end }}
