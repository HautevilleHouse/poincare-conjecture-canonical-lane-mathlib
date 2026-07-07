import PoincareConjectureCanonicalLaneLean.EndpointClassification

/-!
# Ricci Flow Analytic Foundation

This module assembles the Perelman analytic route as a chain of closed evidence
packages. Every major component is an explicit field whose evidence must be
supplied before the route closes.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure RicciFlowAnalyticFoundation where
  curvature : RiemannianCurvaturePackage
  curvatureEvidence : RiemannianCurvatureEvidence curvature
  flow : RicciFlowPDEPackage curvature
  flowEvidence : RicciFlowPDEEvidence flow
  shortTime : ShortTimeExistencePackage flow
  shortTimeEvidence : ShortTimeExistenceEvidence shortTime
  entropy : PerelmanEntropyPackage shortTime
  entropyEvidence : PerelmanEntropyEvidence entropy
  noncollapsing : NoncollapsingPackage entropy
  noncollapsingEvidence : NoncollapsingEvidence noncollapsing
  singularityModels : SingularityModelsPackage noncollapsing
  singularityModelsEvidence : SingularityModelsEvidence singularityModels
  canonicalNeighborhoods : CanonicalNeighborhoodsPackage singularityModels
  canonicalNeighborhoodsEvidence : CanonicalNeighborhoodsEvidence canonicalNeighborhoods
  surgery : SurgeryPackage canonicalNeighborhoods
  surgeryEvidence : SurgeryEvidence surgery
  geometrization : GeometrizationPackage surgery
  geometrizationEvidence : GeometrizationEvidence geometrization
  endpoint : EndpointClassificationPackage geometrization
  endpointEvidence : EndpointClassificationEvidence endpoint

def RicciFlowAnalyticFoundationClosed (A : RicciFlowAnalyticFoundation) : Prop :=
  RiemannianCurvatureClosed A.curvature ∧
  RicciFlowPDEClosed A.flow ∧
  ShortTimeExistenceClosed A.shortTime ∧
  PerelmanEntropyClosed A.entropy ∧
  NoncollapsingClosed A.noncollapsing ∧
  SingularityModelsClosed A.singularityModels ∧
  CanonicalNeighborhoodsClosed A.canonicalNeighborhoods ∧
  SurgeryClosed A.surgery ∧
  GeometrizationClosed A.geometrization ∧
  EndpointClassificationClosed A.endpoint

theorem ricci_flow_analytic_foundation_closed_from_evidence
    (A : RicciFlowAnalyticFoundation) :
    RicciFlowAnalyticFoundationClosed A := by
  exact And.intro (riemannian_curvature_closed_from_evidence A.curvature A.curvatureEvidence)
    (And.intro (ricci_flow_pde_closed_from_evidence A.flow A.flowEvidence)
      (And.intro (short_time_existence_closed_from_evidence A.shortTime A.shortTimeEvidence)
        (And.intro (perelman_entropy_closed_from_evidence A.entropy A.entropyEvidence)
          (And.intro (noncollapsing_closed_from_evidence A.noncollapsing A.noncollapsingEvidence)
            (And.intro (singularity_models_closed_from_evidence A.singularityModels A.singularityModelsEvidence)
              (And.intro (canonical_neighborhoods_closed_from_evidence A.canonicalNeighborhoods A.canonicalNeighborhoodsEvidence)
                (And.intro (surgery_closed_from_evidence A.surgery A.surgeryEvidence)
                  (And.intro (geometrization_closed_from_evidence A.geometrization A.geometrizationEvidence)
                    (endpoint_classification_closed_from_evidence A.endpoint A.endpointEvidence)))))))))

/-- The analytic foundation supplies Mathlib's 3-dimensional sphere endpoint. -/
theorem ricci_flow_analytic_foundation_supplies_sphere_endpoint
    (A : RicciFlowAnalyticFoundation) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      A.endpoint.targetManifold A.endpoint.targetTopology 3 :=
  endpoint_classification_supplies_mathlib_statement A.endpoint

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
