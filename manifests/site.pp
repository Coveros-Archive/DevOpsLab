include '::ntp'
node /^www.*$/ {
	include website
	include php
}
node /^db.*$/ {
	include database
}

node /^selenium.*$/ {
	include selenium
	include '::java'
}