import PoincareConjectureCanonicalLaneLean.SingularityModels

/-!
# Canonical Neighborhoods Package
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CanonicalNeighborhoodsPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    (Q : SingularityModelsPackage N) where
  highCurvatureRegionCovered : Prop
  neckCapDecomposition : Prop
  scaleCompatibility : Prop
  persistenceUnderFlow : Prop

structure CanonicalNeighborhoodsEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) where
  highCurvatureRegionCoveredClosed : C.highCurvatureRegionCovered
  neckCapDecompositionClosed : C.neckCapDecomposition
  scaleCompatibilityClosed : C.scaleCompatibility
  persistenceUnderFlowClosed : C.persistenceUnderFlow

def CanonicalNeighborhoodsClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) : Prop :=
  C.highCurvatureRegionCovered ∧ C.neckCapDecomposition ∧
  C.scaleCompatibility ∧ C.persistenceUnderFlow

theorem canonical_neighborhoods_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    (C : CanonicalNeighborhoodsPackage Q) (E : CanonicalNeighborhoodsEvidence C) :
    CanonicalNeighborhoodsClosed C := by
  exact And.intro E.highCurvatureRegionCoveredClosed
    (And.intro E.neckCapDecompositionClosed
      (And.intro E.scaleCompatibilityClosed E.persistenceUnderFlowClosed))

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
