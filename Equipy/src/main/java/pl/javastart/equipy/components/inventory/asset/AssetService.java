package pl.javastart.equipy.components.inventory.asset;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
class AssetService {

    private final AssetRepository assetRepository;
    private final AssetMapper assetMapper;

    AssetService(AssetRepository assetRepository, AssetMapper assetMapper) {
        this.assetRepository = assetRepository;
        this.assetMapper = assetMapper;
    }

    List<AssetDto> findAll() {
        return assetRepository.findAll()
                .stream()
                .map(assetMapper::toDto)
                .collect(Collectors.toList());
    }

    List<AssetDto> findAllByNameOrSerialNumber(String text) {
        return assetRepository.findAllByNameOrSerialNumber(text)
                .stream()
                .map(assetMapper::toDto)
                .collect(Collectors.toList());
    }
}