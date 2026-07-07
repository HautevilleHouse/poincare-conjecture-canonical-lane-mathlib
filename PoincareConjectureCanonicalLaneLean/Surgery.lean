import PoincareConjectureCanonicalLaneLean.CanonicalNeighborhoods

/-!
# Surgery Package
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure SurgeryPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) where
  surgeryTimesDiscrete : Prop
  surgeryRegionAdmissible : Prop
  postSurgeryMetricControlled : Prop
  monotonicitySurvivesSurgery : Prop
  topologyChangeAccounted : Prop

structure SurgeryEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (U : SurgeryPackage C) where
  surgeryTimesDiscreteClosed : U.surgeryTimesDiscrete
  surgeryRegionAdmissibleClosed : U.surgeryRegionAdmissible
  postSurgeryMetricControlledClosed : U.postSurgeryMetricControlled
  monotonicitySurvivesSurgeryClosed : U.monotonicitySurvivesSurgery
  topologyChangeAccountedClosed : U.topologyChangeAccounted

def SurgeryClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : PerelmanEntropyPackage S} {N : NoncollapsingPackage Epkg}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (U : SurgeryPackage C) : Prop :=
  U.surgeryTimesDiscrete ∧ U.surgeryRegionAdmissible ∧
  U.postSurgeryMetricControlled ∧ U.monotonicitySurvivesSurgery ∧
  U.topologyChangeAccounted

theorem surgery_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage Epkg} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q} (U : SurgeryPackage C)
    (E : SurgeryEvidence U) : SurgeryClosed U := by
  exact And.intro E.surgeryTimesDiscreteClosed
    (And.intro E.surgeryRegionAdmissibleClosed
      (And.intro E.postSurgeryMetricControlledClosed
        (And.intro E.monotonicitySurvivesSurgeryClosed E.topologyChangeAccountedClosed)))

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
