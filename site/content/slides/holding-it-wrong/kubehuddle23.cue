package kubehuddle

import (
	"dagger.io/dagger"
	"github.com/gerhard/kubehuddle22/civo"
)

dagger.#Plan & {
	client: {
		env: {
			CIVO_API_KEY: dagger.#Secret
			NAME:         string | *"kubehuddle"
			FQDN:         string | *"kubehuddle.gerhard.io"
			DOCKER_HOST:  string
		}
		filesystem: {
			"./.kubeconfig.yml": write: contents: actions.k8s_config.export.files["/k8s.yml"]
			"./bootstrap": read: contents:        dagger.#FS
			"./app/html": read: contents:         dagger.#FS
			"./app/nginx": read: contents:        dagger.#FS
			"./app/yaml": {
				read: contents:  dagger.#FS
				write: contents: actions.app.manifest.yaml.export.directories["/yaml"]
			}
		}
	}

	actions: {
		// Show available instance sizes
		sizes: civo.#Sizes & {
			apiKey: client.env.CIVO_API_KEY
		}

		// Show available regions
		regions: civo.#Regions & {
			apiKey: client.env.CIVO_API_KEY
		}

		// Show available K8s apps
		k8s_apps: civo.#K8S.apps & {
			apiKey: client.env.CIVO_API_KEY
		}

		// Destroy a K8s cluster
		k8s_rm: civo.#K8S.destroy & {
			apiKey:      client.env.CIVO_API_KEY
			clusterName: client.env.NAME
		}
	}
}
