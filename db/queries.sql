SELECT 
correlation.id,
correlation_type.name correlation_type,
entity_from.name entity_from,
entity_to.name entity_to
FROM correlation
INNER JOIN correlation_type ON correlation_type.id = correlation.id_correlation_type
INNER JOIN entity entity_from ON entity_from.id = correlation.id_entity_from
INNER JOIN entity entity_to ON entity_to.id = correlation.id_entity_to;

WITH correlation_description AS (
SELECT 
correlation.id,
correlation_type.name correlation_type,
entity_from.name entity_from,
entity_to.name entity_to
FROM correlation
INNER JOIN correlation_type ON correlation_type.id = correlation.id_correlation_type
INNER JOIN entity entity_from ON entity_from.id = correlation.id_entity_from
INNER JOIN entity entity_to ON entity_to.id = correlation.id_entity_to
)
SELECT correlation_cause.*, correlation_effect.* FROM causality
INNER JOIN correlation_description correlation_cause ON correlation_cause.id = causality.id_correlation_cause
INNER JOIN correlation_description correlation_effect ON correlation_effect.id = causality.id_correlation_effect;