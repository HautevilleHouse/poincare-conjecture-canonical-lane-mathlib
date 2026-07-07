import PoincareConjectureCanonicalLaneLean.Noncollapsing

/-!
# Singularity Models Package
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure SingularityModelsPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} (N : NoncollapsingPackage Epkg) where
  blowupSequenceExists : Prop
  ancientSolutionLimit : Prop
  kappaSolutionClassification : Prop
  neckOrCapModel : Prop

structure SingularityModelsEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    (Q : SingularityModelsPackage N) where
  blowupSequenceExistsClosed : Q.blowupSequenceExists
  ancientSolutionLimitClosed : Q.ancientSolutionLimit
  kappaSolutionClassificationClosed : Q.kappaSolutionClassification
  neckOrCapModelClosed : Q.neckOrCapModel

def SingularityModelsClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    (Q : SingularityModelsPackage N) : Prop :=
  Q.blowupSequenceExists ∧ Q.ancientSolutionLimit ∧
  Q.kappaSolutionClassification ∧ Q.neckOrCapModel

theorem singularity_models_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} (Q : SingularityModelsPackage N)
    (E : SingularityModelsEvidence Q) : SingularityModelsClosed Q := by
  exact And.intro E.blowupSequenceExistsClosed
    (And.intro E.ancientSolutionLimitClosed
      (And.intro E.kappaSolutionClassificationClosed E.neckOrCapModelClosed))

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
