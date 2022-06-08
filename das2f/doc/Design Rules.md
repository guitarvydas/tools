# Edge Containment
Given an edge - `das_fact(kin,Edge,edge)` then...

EITHER 
- Source and Target ellipses have the same parent
- OR     Source's parent direct-contains Target's parent
- OR     Target's parent direct-contains Source's parent

These situations are depicted in drawings

## Source and Target Ellipses Have the Same Parent
[Same Parent](./designrules-Edge-Containment-1.svg)

![[designrules-Edge-Containment-1.svg]]
## Source's Parent Direct-Contains Target's Parent
[Source Parent Contains Target Parent](designrules-Edge-Containment-2.svg)
![[designrules-Edge-Containment-2.svg]]
## Target's Parent Direct-Contains Source's Parent
[Target Parent Contains Source Parent](./designrules-Edge-Containment-3.svg)

![[designrules-Edge-Containment-3.svg]]

## PROLOG
### For Every Edge
```
das_fact(kind,Edge,edge)
```
### Must: Get short IDs
```
diagram_fact(source,Edge,SourceLongID)
diagram_fact(synonym,SourceID,SourceLongID)
diagram_fact(target,Edge,TargetLongID)
diagram_fact(synonym,TargetID,TargetLongID)
```
### Must: get parents
```
diagram_fact(direct-contains,SourceParent,SourceID)
diagram_fact(direct-contains,TargetParent,TargetID)
```
### Must: get containers of parents
```
diagram_fact(direct-contains,SourceContainer,SourceParent)
diagram_fact(direct-contains,TargetContainer,TargetParent)
```

### D.R. 1
```
SourceContainer = TargetContainer
```
### D.R. 2
```
das_fact(direct_contains,SourceContainer,TargetContainer)
```
### D.R. 3
```
das_fact(direct_contains,TargetContainer,SourceContainer)
```
### On Failure:
```
"design rule failed: Edge Containment edge=~w source=~w target=~w~n", [Edge,SouceID,TargetID]
```
### Code
see designrule-edgecontainment.md
