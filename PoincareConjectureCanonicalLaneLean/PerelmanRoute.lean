import PoincareConjectureCanonicalLaneLean.FinalTheorem
import PoincareConjectureCanonicalLaneLean.RicciFlowAnalyticFoundation
import Mathlib.Geometry.Manifold.PoincareConjecture

/-!
# Perelman Route Layer

This module records the theorem-route obligations that connect the Poincaré
Canonical Lane package to the Perelman/Hamilton geometric route: Ricci flow,
controlled singularity handling, geometrization, and endpoint classification.

The module binds to Mathlib's Poincaré statement layer where available and keeps
the full Ricci-flow-with-surgery analytic development as an explicit carried
formalization obligation.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

/-- Mathlib's smooth Poincaré statement family, specialized to dimension 3. -/
abbrev MathlibSmoothPoincareThreeFamily (M : Type u) [TopologicalSpace M] : Prop :=
  ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3

/--
The Perelman-route obligations needed before the analytic proof route can be
counted as closed inside Lean.
-/
structure PerelmanRouteObligations where
  ricciFlowWithSurgery : Prop
  entropyMonotonicity : Prop
  noncollapsing : Prop
  canonicalNeighborhoods : Prop
  surgeryControl : Prop
  finiteExtinctionOrGeometrization : Prop
  endpointClassification : Prop

/-- Closed evidence for each Perelman-route obligation. -/
structure PerelmanRouteEvidence (R : PerelmanRouteObligations) where
  ricciFlowWithSurgeryClosed : R.ricciFlowWithSurgery
  entropyMonotonicityClosed : R.entropyMonotonicity
  noncollapsingClosed : R.noncollapsing
  canonicalNeighborhoodsClosed : R.canonicalNeighborhoods
  surgeryControlClosed : R.surgeryControl
  finiteExtinctionOrGeometrizationClosed : R.finiteExtinctionOrGeometrization
  endpointClassificationClosed : R.endpointClassification

/--
The Perelman route is closed only when each obligation has closed evidence.
-/
def PerelmanRouteClosed (R : PerelmanRouteObligations) : Prop :=
  R.ricciFlowWithSurgery ∧
  R.entropyMonotonicity ∧
  R.noncollapsing ∧
  R.canonicalNeighborhoods ∧
  R.surgeryControl ∧
  R.finiteExtinctionOrGeometrization ∧
  R.endpointClassification

/--
Projection from the analytic foundation into the Perelman-route obligation set.
-/
def RicciFlowAnalyticFoundation.toPerelmanRouteObligations
    (A : RicciFlowAnalyticFoundation) : PerelmanRouteObligations := {
  ricciFlowWithSurgery := RicciFlowPDEClosed A.flow ∧ SurgeryClosed A.surgery
  entropyMonotonicity := PerelmanEntropyClosed A.entropy
  noncollapsing := NoncollapsingClosed A.noncollapsing
  canonicalNeighborhoods := CanonicalNeighborhoodsClosed A.canonicalNeighborhoods
  surgeryControl := SurgeryClosed A.surgery
  finiteExtinctionOrGeometrization := GeometrizationClosed A.geometrization
  endpointClassification := EndpointClassificationClosed A.endpoint
}

/-- The full analytic Ricci-flow proof remains the explicit formalization payload. -/
def perelmanAnalyticFormalizationPayload : String :=
  "Ricci flow with surgery, entropy monotonicity, noncollapsing, canonical neighborhoods, surgery control, finite extinction or geometrization, and endpoint classification."

/--
Closed Perelman-route evidence gives the closed Perelman-route proposition.
-/
theorem perelman_route_closed_from_evidence
    (R : PerelmanRouteObligations) (E : PerelmanRouteEvidence R) :
    PerelmanRouteClosed R := by
  exact And.intro E.ricciFlowWithSurgeryClosed
    (And.intro E.entropyMonotonicityClosed
      (And.intro E.noncollapsingClosed
        (And.intro E.canonicalNeighborhoodsClosed
          (And.intro E.surgeryControlClosed
            (And.intro E.finiteExtinctionOrGeometrizationClosed
              E.endpointClassificationClosed)))))

/--
Closed Ricci-flow analytic foundation evidence produces the Perelman-route
obligation evidence used by this module.
-/
def perelman_route_evidence_from_analytic_foundation
    (A : RicciFlowAnalyticFoundation) :
    PerelmanRouteEvidence A.toPerelmanRouteObligations := {
  ricciFlowWithSurgeryClosed := And.intro
    (ricci_flow_pde_closed_from_evidence A.flow A.flowEvidence)
    (surgery_closed_from_evidence A.surgery A.surgeryEvidence)
  entropyMonotonicityClosed := perelman_entropy_closed_from_evidence A.entropy A.entropyEvidence
  noncollapsingClosed := noncollapsing_closed_from_evidence A.noncollapsing A.noncollapsingEvidence
  canonicalNeighborhoodsClosed := canonical_neighborhoods_closed_from_evidence A.canonicalNeighborhoods A.canonicalNeighborhoodsEvidence
  surgeryControlClosed := surgery_closed_from_evidence A.surgery A.surgeryEvidence
  finiteExtinctionOrGeometrizationClosed := geometrization_closed_from_evidence A.geometrization A.geometrizationEvidence
  endpointClassificationClosed := endpoint_classification_closed_from_evidence A.endpoint A.endpointEvidence
}

/--
A closed Ricci-flow analytic foundation closes the Perelman-route obligation set.
-/
theorem perelman_route_closed_from_analytic_foundation
    (A : RicciFlowAnalyticFoundation) :
    PerelmanRouteClosed A.toPerelmanRouteObligations := by
  exact perelman_route_closed_from_evidence
    A.toPerelmanRouteObligations
    (perelman_route_evidence_from_analytic_foundation A)

/--
A Perelman route for an admitted Poincaré object supplies the geometric route and
also the Canonical Lane bridge/gate closure required by this package.
-/
structure PerelmanCanonicalLaneRoute (A : AdmissibleClass) where
  obligations : PerelmanRouteObligations
  evidence : PerelmanRouteEvidence obligations
  bridgeClosedFromRoute : bridgeClosed A
  gateClosedFromRoute : gateClosed A

/--
The Perelman route projects into the constrained Poincaré closure once its
route evidence, bridge, and gate are closed.
-/
theorem perelman_route_yields_constrained_poincare_closure
    (A : AdmissibleClass) (R : PerelmanCanonicalLaneRoute A) :
    ConstrainedPoincareClosure A := by
  exact And.intro R.bridgeClosedFromRoute R.gateClosedFromRoute

/-- The Perelman-route layer imports Mathlib's Poincaré statement family. -/
theorem mathlib_smooth_poincare_three_family_available
    (M : Type u) [TopologicalSpace M] :
    MathlibSmoothPoincareThreeFamily M =
      ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3 := by
  rfl

/-- The analytic payload is carried as a named formalization route. -/
theorem perelman_analytic_payload_named :
    perelmanAnalyticFormalizationPayload =
      "Ricci flow with surgery, entropy monotonicity, noncollapsing, canonical neighborhoods, surgery control, finite extinction or geometrization, and endpoint classification." := by
  rfl

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
