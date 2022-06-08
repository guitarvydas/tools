# design rule edge containment
%% use experimental editor https://ohmlang.github.io/editor/?ohm-js=next
## parameters
  Edge SourceContainer TargetContainer
## imports
  shapes onSameDiagram inside names ports contains
## rule
  %% see "doc/Design Rules.md"
  forall das_fact(kind,Edge,edge)
    diagram_fact(source,Edge,SourceLongID)
    diagram_fact(synonym,SourceID,SourceLongID)
    diagram_fact(target,Edge,TargetLongID)
    diagram_fact(synonym,TargetID,TargetLongID)
	das_fact(direct_contains,SourceContainer,SourceID)
    das_fact(direct_contains,TargetContainer,TargetID)
    cond
      ( das_fact(direct_contains,Uber,TargetContainer), das_fact(direct_contains,Uber,SourceContainer) )      
      ( das_fact(direct_contains,SourceContainer,TargetContainer) )
      ( das_fact(direct_contains,TargetContainer,SourceContainer) )
    endcond
  endforall
## on failure
Edge Containment edge=${Edge} is not contained by any Component (internal error: inferencing rules did not catch this case)
Source Container ${SourceContainer}
Target Container ${TargetContainer}




	
