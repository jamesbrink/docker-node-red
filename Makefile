NAME = jamesbrink/node-red
TEMPLATE=Dockerfile.template

.PHONY: all latest 0.16.2 0.15.3 0.14.6
.DEFAULT_GOAL := latest

all: latest 0.16.2 0.15.3 0.14.6

latest:
	mkdir -p $(@)
	printf "`cat $(TEMPLATE)`" $(@) $(@) HEAD > $(@)/Dockerfile
	docker build -t $(NAME):$(@) $(@)

0.16.2:
	mkdir -p $(@)
	printf "`cat $(TEMPLATE)`" $(@) $(@) $(@) > $(@)/Dockerfile
	docker build -t $(NAME):$(@) $(@)

0.15.3:
	mkdir -p $(@)
	printf "`cat $(TEMPLATE)`" $(@) $(@) $(@) > $(@)/Dockerfile
	docker build -t $(NAME):$(@) $(@)

0.14.6:
	mkdir -p $(@)
	printf "`cat $(TEMPLATE)`" $(@) $(@) $(@) > $(@)/Dockerfile
	docker build -t $(NAME):$(@) $(@)

