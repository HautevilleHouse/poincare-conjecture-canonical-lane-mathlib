import Mathlib.Topology.Basic

/-!
# Riemannian Curvature Package

This module defines the local formal objects used by the Perelman analytic route:
a three-dimensional Riemannian manifold package, Riemann curvature, Ricci tensor,
and scalar curvature. The fields record proof obligations; later modules compose
those obligations into the Ricci-flow route.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure RiemannianCurvaturePackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  riemannCurvatureTensor : Type w
  ricciTensor : Type x
  scalarCurvature : Type y
  smoothThreeManifold : Prop
  metricSmooth : Prop
  riemannTensorLawful : Prop
  ricciTensorContractedFromRiemann : Prop
  scalarCurvatureTraceOfRicci : Prop

structure RiemannianCurvatureEvidence (G : RiemannianCurvaturePackage) where
  smoothThreeManifoldClosed : G.smoothThreeManifold
  metricSmoothClosed : G.metricSmooth
  riemannTensorLawfulClosed : G.riemannTensorLawful
  ricciTensorContractedFromRiemannClosed : G.ricciTensorContractedFromRiemann
  scalarCurvatureTraceOfRicciClosed : G.scalarCurvatureTraceOfRicci

def RiemannianCurvatureClosed (G : RiemannianCurvaturePackage) : Prop :=
  G.smoothThreeManifold ∧
  G.metricSmooth ∧
  G.riemannTensorLawful ∧
  G.ricciTensorContractedFromRiemann ∧
  G.scalarCurvatureTraceOfRicci

theorem riemannian_curvature_closed_from_evidence
    (G : RiemannianCurvaturePackage) (E : RiemannianCurvatureEvidence G) :
    RiemannianCurvatureClosed G := by
  exact And.intro E.smoothThreeManifoldClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.riemannTensorLawfulClosed
        (And.intro E.ricciTensorContractedFromRiemannClosed
          E.scalarCurvatureTraceOfRicciClosed)))

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
