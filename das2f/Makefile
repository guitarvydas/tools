QUERYSOURCES=\
connection.md \
contains_edge1.md \
contains_edge2.md \
contains_edge3.md \
contains_port.md \
direct_contains.md \
indirect_contains.md \
layer2.md \
layerallcontains.md \
layerboundingbox.md \
layercolor.md \
layerdirection.md \
layerkind.md \
layername.md \
synccode.md \
view0.md \
view0b.md \
view0c.md \
view1.md \
view2.md \
view3.md \
view_2.md

QUERIES=\
layer4_query.bash \
layer5_query.bash \
layer6_query.bash \
layerallcontains_query.bash \
layerboundingbox_query.bash \
layercolor_query.bash \
layerconnection_query.bash \
layerdirection_query.bash \
layeredgecontainment1_query.bash \
layeredgecontainment2_query.bash \
layeredgecontainment3_query.bash \
layerkind_query.bash \
layername_query.bash \
layersynccode_query.bash


all: $(QUERIES)

$(QUERIES) : $(QUERYSOURCES)
	./build.bash ..

clean:
	rm -f layer*.bash
	rm -f preprocessed*
	rm -f a-dr-edgecontainment
	rm -f b-dr-edgecontainment
	rm -f out.json
	rm -f view*.bash view*.pl view*.js

