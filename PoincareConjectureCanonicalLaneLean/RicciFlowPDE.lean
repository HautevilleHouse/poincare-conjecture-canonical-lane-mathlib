import PoincareConjectureCanonicalLaneLean.RiemannianCurvature

/-!
# Ricci Flow PDE Package

This module records the Ricci-flow equation over a Riemannian curvature package.
The analytic content is expressed as explicit proof obligations carried by the
package.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure RicciFlowPDEPackage (G : RiemannianCurvaturePackage) where
  timeParameter : Type u
  metricAt : timeParameter -> Type v
  initialMetricMatches : Prop
  differentiableMetricFamily : Prop
  ricciFlowEquation : Prop
  maximalTimeInterval : Prop

structure RicciFlowPDEEvidence {G : RiemannianCurvaturePackage}
    (F : RicciFlowPDEPackage G) where
  initialMetricMatchesClosed : F.initialMetricMatches
  differentiableMetricFamilyClosed : F.differentiableMetricFamily
  ricciFlowEquationClosed : F.ricciFlowEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def RicciFlowPDEClosed {G : RiemannianCurvaturePackage}
    (F : RicciFlowPDEPackage G) : Prop :=
  F.initialMetricMatches ∧
  F.differentiableMetricFamily ∧
  F.ricciFlowEquation ∧
  F.maximalTimeInterval

theorem ricci_flow_pde_closed_from_evidence
    {G : RiemannianCurvaturePackage} (F : RicciFlowPDEPackage G)
    (E : RicciFlowPDEEvidence F) : RicciFlowPDEClosed F := by
  exact And.intro E.initialMetricMatchesClosed
    (And.intro E.differentiableMetricFamilyClosed
      (And.intro E.ricciFlowEquationClosed E.maximalTimeIntervalClosed))

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
