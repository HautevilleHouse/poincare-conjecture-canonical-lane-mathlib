import PoincareConjectureCanonicalLaneLean.RicciFlowPDE

/-!
# Short-Time Existence Package
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure ShortTimeExistencePackage {G : RiemannianCurvaturePackage}
    (F : RicciFlowPDEPackage G) where
  initialMetricRegular : Prop
  parabolicWellPosedness : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  smoothDependence : Prop

structure ShortTimeExistenceEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  initialMetricRegularClosed : S.initialMetricRegular
  parabolicWellPosednessClosed : S.parabolicWellPosedness
  localExistenceIntervalClosed : S.localExistenceInterval
  uniquenessOnOverlapClosed : S.uniquenessOnOverlap
  smoothDependenceClosed : S.smoothDependence

def ShortTimeExistenceClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) : Prop :=
  S.initialMetricRegular ∧
  S.parabolicWellPosedness ∧
  S.localExistenceInterval ∧
  S.uniquenessOnOverlap ∧
  S.smoothDependence

theorem short_time_existence_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    (S : ShortTimeExistencePackage F) (E : ShortTimeExistenceEvidence S) :
    ShortTimeExistenceClosed S := by
  exact And.intro E.initialMetricRegularClosed
    (And.intro E.parabolicWellPosednessClosed
      (And.intro E.localExistenceIntervalClosed
        (And.intro E.uniquenessOnOverlapClosed E.smoothDependenceClosed)))

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
