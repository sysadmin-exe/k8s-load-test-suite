{{/*
Expand the name of the chart.
*/}}
{{- define "http-echo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "http-echo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "http-echo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "http-echo.labels" -}}
helm.sh/chart: {{ include "http-echo.chart" . }}
{{ include "http-echo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "http-echo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "http-echo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Instance specific labels
*/}}
{{- define "http-echo.instanceLabels" -}}
helm.sh/chart: {{ include "http-echo.chart" .root }}
app.kubernetes.io/name: {{ include "http-echo.name" .root }}-{{ .instance.name }}
app.kubernetes.io/instance: {{ .root.Release.Name }}-{{ .instance.name }}
{{- if .root.Chart.AppVersion }}
app.kubernetes.io/version: {{ .root.Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .root.Release.Service }}
{{- end }}

{{/*
Instance specific selector labels
*/}}
{{- define "http-echo.instanceSelectorLabels" -}}
app.kubernetes.io/name: {{ include "http-echo.name" .root }}-{{ .instance.name }}
app.kubernetes.io/instance: {{ .root.Release.Name }}-{{ .instance.name }}
{{- end }}
