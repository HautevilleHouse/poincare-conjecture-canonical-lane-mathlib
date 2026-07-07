import PoincareConjectureCanonicalLaneLean.ShortTimeExistence

/-!
# Perelman Entropy Package
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure PerelmanEntropyPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  entropyFunctional : Type u
  reducedVolume : Type v
  monotonicityFormula : Prop
  entropyLowerBound : Prop
  noLocalCollapsingInput : Prop

structure PerelmanEntropyEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : PerelmanEntropyPackage S) where
  monotonicityFormulaClosed : Epkg.monotonicityFormula
  entropyLowerBoundClosed : Epkg.entropyLowerBound
  noLocalCollapsingInputClosed : Epkg.noLocalCollapsingInput

def PerelmanEntropyClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : PerelmanEntropyPackage S) : Prop :=
  Epkg.monotonicityFormula ∧ Epkg.entropyLowerBound ∧ Epkg.noLocalCollapsingInput

theorem perelman_entropy_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (Epkg : PerelmanEntropyPackage S)
    (E : PerelmanEntropyEvidence Epkg) : PerelmanEntropyClosed Epkg := by
  exact And.intro E.monotonicityFormulaClosed
    (And.intro E.entropyLowerBoundClosed E.noLocalCollapsingInputClosed)

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
