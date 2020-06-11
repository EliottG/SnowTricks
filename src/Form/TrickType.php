<?php

namespace App\Form;

use App\Entity\Trick;

use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TrickType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('description')
            ->add('category', ChoiceType::class, [
                'label' => 'Catégorie',
                'choices' => [
                    'Slide' => 'Slide',
                    'Grab' => 'Grab',
                    'Flip' => 'Flip',
                    'Rotation' => 'Rotation'
                ]
            ])
            ->add('main_image', FileType::class, [
                'required' => false,
                'mapped' => false, 
                'label' => 'Image principale'
            ])
            ->add('picture', FileType::class, [
                'label' => 'Images',
                'multiple' => true,
                'mapped' => false,
                'required' => false,
            ])
            ->add('videos', TextType::class, [
                'label' => 'Liens vidéos Youtube, Dailymotion (si vous souhaitez en mettre plusieurs séparez les par une virgule)',
                'mapped' => false,
                'required' => false
            ])
            
            ->add('Enregistrer', SubmitType::class);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Trick::class,
        ]);
    }
}
