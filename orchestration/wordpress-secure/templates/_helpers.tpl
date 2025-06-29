{{/* Common labels */}}
{{- define "wordpress-secure.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/* Image pull secret */}}
{{- define "wordpress-secure.imagePullSecret" }}
{{- printf "{\"auths\": {\"ghcr.io\": {\"auth\": \"%s\"}}}" (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) }}
{{- end }}

{{/* Namespace */}}
{{- define "wordpress-secure.namespace" -}}
{{- .Values.namespace | default "default" -}}
{{- end -}}