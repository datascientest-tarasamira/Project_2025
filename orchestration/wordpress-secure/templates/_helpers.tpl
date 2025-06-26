{{/* Common labels */}}
{{- define "wordpress-secure.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Image pull secret */}}
{{- define "wordpress-secure.imagePullSecret" }}
{{- printf "{\"auths\": {\"ghcr.io\": {\"auth\": \"%s\"}}}" (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) }}
{{- end }}

{{/* Namespace */}}
{{- define "wordpress-secure.namespace" -}}
{{- .Values.namespace | default "default" -}}
{{- end -}}